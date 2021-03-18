require "httparty"

RSpec.describe "Validar o contrato da api de previsão do tempo openweathermap" do

  key = "1000a5fd40e9a1493f948bb35205b744"
  city = ENV["CITY"]
  id = nil

  it "Deve retornar as tipagens de acordo com a documentação" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response).to be_a_kind_of(Object)
    expect(response["coord"]).to be_a_kind_of(Object)
    expect(response["coord"]["lon"]).to be_a_kind_of(Float)
    expect(response["coord"]["lat"]).to be_a_kind_of(Float)
    expect(response["weather"]).to be_a_kind_of(Array)
    response["weather"].each do |item|
      expect(item["id"]).to be_a_kind_of(Integer)
      expect(item["main"]).to be_a_kind_of(String)
      expect(item["description"]).to be_a_kind_of(String)
      expect(item["icon"]).to be_a_kind_of(String)
    end
    expect(response["base"]).to be_a_kind_of(String)
    expect(response["main"]).to be_a_kind_of(Object)
    expect(response["main"]["temp"]).to be_a_kind_of(Float)
    expect(response["main"]["feels_like"]).to be_a_kind_of(Float)
    expect(response["main"]["temp_min"]).to be_a_kind_of(Float)
    expect(response["main"]["temp_max"]).to be_a_kind_of(Float)
    expect(response["main"]["pressure"]).to be_a_kind_of(Integer)
    expect(response["main"]["humidity"]).to be_a_kind_of(Integer)
    expect(response["visibility"]).to be_a_kind_of(Integer)
    expect(response["wind"]).to be_a_kind_of(Object)
    expect(response["wind"]["speed"]).to be_a_kind_of(Float)
    expect(response["wind"]["deg"]).to be_a_kind_of(Integer)
    expect(response["clouds"]).to be_a_kind_of(Object)
    expect(response["clouds"]["all"]).to be_a_kind_of(Integer)
    expect(response["dt"]).to be_a_kind_of(Integer)
    expect(response["sys"]).to be_a_kind_of(Object)
    expect(response["sys"]["type"]).to be_a_kind_of(Integer)
    expect(response["sys"]["id"]).to be_a_kind_of(Integer)
    expect(response["sys"]["country"]).to be_a_kind_of(String)
    expect(response["sys"]["sunrise"]).to be_a_kind_of(Integer)
    expect(response["sys"]["sunset"]).to be_a_kind_of(Integer)
    expect(response["timezone"]).to be_a_kind_of(Integer)
    expect(response["id"]).to be_a_kind_of(Integer)
    expect(response["name"]).to be_a_kind_of(String)
    expect(response["cod"]).to be_a_kind_of(Integer)
  end
end