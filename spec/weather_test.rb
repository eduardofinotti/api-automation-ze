require "httparty"

RSpec.describe "Validar os retornos da api de previsão do tempo openweathermap" do

  key = "1000a5fd40e9a1493f948bb35205b744"
  city = ENV["CITY"]
  id = nil

  it "Deve pegar o ID da cidade informada" do
    responseId = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    id = responseId["id"].to_s
    expect(id).not_to eql(nil)
  end

  it "Deve retornar 200 para a request valida" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["cod"]).to eql(200)
  end

  it "O retorno não deve ser vazio" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response).not_to be_empty
  end

  # coordenadas
  it "Deve retornar as coordenadas da cidade" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["coord"]["lon"]).to eql(-0.1257)
    expect(response["coord"]["lat"]).to eql(51.5085)
  end

  it "Deve retornar as coordenadas cidade pelo código" do
    response = HttParty.get("/weather?id=" + id + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["coord"]["lon"]).to eql(-0.1257)
    expect(response["coord"]["lat"]).to eql(51.5085)
  end

  # tempo
  it "Deve retornar o tempo da cidade" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["weather"]).not_to eql("")
    response["weather"].each do |item|
      expect(item["id"]).not_to eql("")
      expect(item["id"]).not_to eql(0)
      expect(item["main"]).not_to eql("")
      expect(item["description"]).not_to eql("")
      expect(item["icon"]).not_to eql("")
    end
  end

  it "Deve retornar o tempo da cidade pelo código" do
    response = HttParty.get("/weather?id=" + id + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["weather"]).not_to eql("")
    response["weather"].each do |item|
      expect(item["id"]).not_to eql("")
      expect(item["id"]).not_to eql(0)
      expect(item["main"]).not_to eql("")
      expect(item["description"]).not_to eql("")
      expect(item["icon"]).not_to eql("")
    end
  end

  # base
  it "Deve retornar o 'base' da informação pela cidade" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["base"]).not_to eql("")
    expect(response["base"]).to eql("stations")
  end
  
  it "Deve retornar o 'base' da informação pelo código da cidade" do
    response = HttParty.get("/weather?id=" + id + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["base"]).not_to eql("")
    expect(response["base"]).to eql("stations")
  end

  # main info
  it "Deve retornar detalhes do tempo da cidade" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["main"]["temp"]).not_to eql(0)
    expect(response["main"]["temp"]).not_to eql("")
    expect(response["main"]["feels_like"]).not_to eql(0)
    expect(response["main"]["feels_like"]).not_to eql("")
    expect(response["main"]["temp_min"]).not_to eql(0)
    expect(response["main"]["temp_min"]).not_to eql("")
    expect(response["main"]["temp_max"]).not_to eql(0)
    expect(response["main"]["temp_max"]).not_to eql("")
    expect(response["main"]["pressure"]).not_to eql(0)
    expect(response["main"]["pressure"]).not_to eql("")
    expect(response["main"]["humidity"]).not_to eql(0)
    expect(response["main"]["humidity"]).not_to eql("")
  end
  
  it "Deve retornar detalhes do tempo da cidade pelo código" do
    response = HttParty.get("/weather?id=" + id + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["main"]["temp"]).not_to eql(0)
    expect(response["main"]["temp"]).not_to eql("")
    expect(response["main"]["feels_like"]).not_to eql(0)
    expect(response["main"]["feels_like"]).not_to eql("")
    expect(response["main"]["temp_min"]).not_to eql(0)
    expect(response["main"]["temp_min"]).not_to eql("")
    expect(response["main"]["temp_max"]).not_to eql(0)
    expect(response["main"]["temp_max"]).not_to eql("")
    expect(response["main"]["pressure"]).not_to eql(0)
    expect(response["main"]["pressure"]).not_to eql("")
    expect(response["main"]["humidity"]).not_to eql(0)
    expect(response["main"]["humidity"]).not_to eql("")
  end

  # visibility
  it "Deve retornar a visibilidade da cidade" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["visibility"]).not_to eql(0)
    expect(response["visibility"]).not_to eql("")
  end
  
  it "Deve retornar a visibilidade da cidade pelo código" do
    response = HttParty.get("/weather?id=" + id + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["visibility"]).not_to eql(0)
    expect(response["visibility"]).not_to eql("")
  end

  # wind
  it "Deve retornar informações do vento da cidade" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["wind"]["speed"]).not_to eql(0)
    expect(response["wind"]["speed"]).not_to eql("")
    expect(response["wind"]["deg"]).not_to eql(0)
    expect(response["wind"]["deg"]).not_to eql("")
  end
  
  it "Deve retornar informações do vento da cidade pelo código" do
    response = HttParty.get("/weather?id=" + id + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["wind"]["speed"]).not_to eql(0)
    expect(response["wind"]["speed"]).not_to eql("")
    expect(response["wind"]["deg"]).not_to eql(0)
    expect(response["wind"]["deg"]).not_to eql("")
  end

  # clouds
  it "Deve retornar informações das nuvens da cidade" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["clouds"]["all"]).not_to eql(0)
    expect(response["clouds"]["all"]).not_to eql("")
  end
  
  it "Deve retornar informações das nuvens da cidade pelo código" do
    response = HttParty.get("/weather?id=" + id + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["clouds"]["all"]).not_to eql(0)
    expect(response["clouds"]["all"]).not_to eql("")
  end

  # Time of data
  it "Deve retornar informações do tempo de calculo do clima da cidade" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["dt"]).not_to eql(0)
    expect(response["dt"]).not_to eql("")
  end

  it "Deve retornar informações do tempo de calculo do clima da cidade pelo código" do
    response = HttParty.get("/weather?id=" + id + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["dt"]).not_to eql(0)
    expect(response["dt"]).not_to eql("")
  end

  # City informations
  it "Deve retornar informações da cidade" do
    response = HttParty.get("/weather?q=" +  city + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["timezone"]).not_to eql("")
    expect(response["id"]).not_to eql("")
    expect(response["id"]).not_to eql(0)
    cityName = city.split(",")
    expect(response["name"]).to eql(cityName[0])
  end

  it "Deve retornar informações da cidade pelo código" do
    response = HttParty.get("/weather?id=" + id + "&appid=" + key)
    expect(response.code).to eql(200)
    expect(response["timezone"]).not_to eql("")
    expect(response["id"]).not_to eql("")
    expect(response["id"]).not_to eql(0)
    expect(response["name"]).to eql("London")
  end
end
