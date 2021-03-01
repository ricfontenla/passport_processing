class PassportOrganizer

  #atributos
  attr_reader :csv, :list

  #construtor
  def initialize(csv)
    @csv = csv
    @list = organizer(csv)        
  end

  #metodos
  def verification
    valids = 0
    list.each do |hash|
      if (hash.key?('byr') == true && hash.key?('iyr') == true && hash.key?('eyr') == true && hash.key?('hgt') == true &&
        hash.key?('hcl') == true && hash.key?('ecl') == true && hash.key?('pid') == true)
        valids += 1
      end
    end
    return valids
  end
  
  #metodos privados
  private
  
  def organizer(csv)
    l = []
    arrays = []
    passport= []
    passport_hash = {}
    csv.each do |line|
      if line[0].nil? == false
        arrays << line[0].split(' ')
      else
        arrays.each do |array|
          passport.concat(array)
        end
        passport_hash = hash_organizer(passport)
        l << passport_hash
        passport = []
        passport_hash = {}
        arrays = []
      end
    end  
    return l  
  end

  def hash_organizer(passport)
    hash = {}
    key_value = []
    passport.each do |s|
      key_value = s.split(':')
      hash[key_value[0]] = key_value[1]
    end
    return hash
  end

end
