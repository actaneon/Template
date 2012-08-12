require 'xmlsimple'

class RecipemlLoader

  attr_accessor :filename

  def initialize(path = '/Users/jking/Sites/recipes/data/Adobo.xml')
    @filename = path
    @file = File.open(@filename)
  end

  def xml_data
    @xml_data ||= @file.read
  end

  def hash
    xml = XmlSimple.new
    data = xml.xml_in(xml_data)
    @hash ||= data.with_indifferent_access
  end

  def simplify_hash
    title = hash[:recipe][0][:head][0][:title][0]
    ingredients = hash[:recipe][0][:ingredients][0][:ing]
    steps = hash[:recipe][0][:directions][0][:step]

    ingredients2 = ingredients.map do |ing|
      amt = ing[:amt][0]
      qty = amt[:qty][0].to_i rescue 0
      unit = nullify_empty_hash amt[:unit][0]
      item = ing[:item][0]
      note = nullify_empty_hash ing['ing-note'][0]

      {:quantity => qty, :unit => unit, :item => item, :note => note}
    end

    {:title => title,
     :ingredients => ingredients2,
     :steps => steps}
  end

  def nullify_empty_hash(value)
    (value.to_s == '{}') ? nil : value
  end

  def load
    x = simplify_hash

    r = Recipe.new
    r.title = x[:title]
    r.save

  end

end
