defmodule Talib.BollingerBandTest do
  use ExUnit.Case
  alias Talib.BollingerBand

  doctest Talib.BollingerBand

  defmodule Fixtures do
    def numbers do
      [
        89, 77,  53, 64, 78, 67, 30,  6, 24, 53,
        46, 30, 100, 48, 34, 69, 40, 44, 66, 89
      ]
    end

    def numbers_with_nil do
      [
        89, 77,  53, 64, 78, 67, 30,  6, 24, 53,
        46, 30, 100, 48, 34, 69, nil, 40, 44, 66,
      ]
    end

    def numbers_bband_5_2 do
      [{nil, nil, nil}, 
       {nil, nil, nil}, 
       {nil, nil, nil}, 
       {nil, nil, nil}, 
       {99.26935536727834, 72.2, 45.130644632721676}, 
       {92.6965861113527, 67.8, 42.9034138886473}, 
       {76.79130229211624, 58.4, 40.008697707883755}, 
       {81.56009827994995, 49.0, 16.439901720050045}, 
       {94.66563145999496, 41.0, -12.665631459994955}, 
       {90.25863986500215, 36.0, -18.258639865002145}, 
       {74.97406628984581, 31.8, -11.374066289845803}, 
       {65.03612492454559, 31.8, -1.4361249245455845}, 
       {83.83612492454557, 50.6, 17.363875075454423}, 
       {109.05966828074881, 55.4, 1.7403317192511878}, 
       {98.78643872978762, 51.6, 4.413561270212391}, 
       {106.50467175123997, 56.2, 5.895328248760038}, 
       {109.80465095318445, 58.2, 6.5953490468155636}, 
       {95.03998334720777, 47.0, -1.039983347207773}, 
       {74.46629422428208, 50.6, 26.733705775717926}, 
       {89.98591199873627, 61.6, 33.214088001263725}
     ]
    end
    def numbers_bband_5_2_with_nil do
      [{nil, nil, nil}, 
       {nil, nil, nil}, 
       {nil, nil, nil}, 
       {nil, nil, nil}, 
       {99.26935536727834, 72.2, 45.130644632721676}, 
       {92.6965861113527, 67.8, 42.9034138886473}, 
       {76.79130229211624, 58.4, 40.008697707883755}, 
       {81.56009827994995, 49.0, 16.439901720050045}, 
       {94.66563145999496, 41.0, -12.665631459994955}, 
       {90.25863986500215, 36.0, -18.258639865002145}, 
       {74.97406628984581, 31.8, -11.374066289845803}, 
       {65.03612492454559, 31.8, -1.4361249245455845}, 
       {83.83612492454557, 50.6, 17.363875075454423}, 
       {109.05966828074881, 55.4, 1.7403317192511878}, 
       {98.78643872978762, 51.6, 4.413561270212391}, 
       {106.50467175123997, 56.2, 5.895328248760038}, 
       {114.35465095318443, 62.75, 11.14534904681556}, 
       {97.4566393955576, 47.75, -1.956639395557609}, 
       {73.22168298389809, 46.75, 20.278317016101905}, 
       {81.40989497353657, 54.75, 28.090105026463437}]
    end
  end

  test "from_list/4" do
    assert BollingerBand.from_list(Fixtures.numbers, 5, 2) ==
      {:ok, %Talib.BollingerBand{
        period: 5,
        deviation: 2,
        values: Fixtures.numbers_bband_5_2
      }}

    assert BollingerBand.from_list(Fixtures.numbers_with_nil, 5, 2) ==
      {:ok, %Talib.BollingerBand{
        period: 5,
        deviation: 2,
        values: Fixtures.numbers_bband_5_2_with_nil
      }}

    
    assert BollingerBand.from_list([3], 3, 2) ==
      {:ok, %Talib.BollingerBand{
        period: 3,
        deviation: 2,
        values: [{nil, nil, nil}]
      }}

    assert BollingerBand.from_list([1]) ==
      {:ok, %Talib.BollingerBand{
        period: 20,
        deviation: 2,
        values: [{nil, nil, nil}]
      }}

    assert BollingerBand.from_list([]) === {:error, :no_data}
  end
end
