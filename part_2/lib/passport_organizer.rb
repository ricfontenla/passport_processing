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
      
        if hash['byr'].to_i >= 1920 && hash['byr'].to_i <= 2002 && hash['iyr'].to_i >= 2010 && hash['iyr'].to_i <= 2020 && 
        hash['eyr'].to_i >= 2020 && hash['eyr'].to_i <= 2030 && (hash['hgt'].include?('cm') && hash['hgt'].delete_suffix('cm').to_i >= 150 && 
        hash['hgt'].delete_suffix('cm').to_i <= 193 || hash['hgt'].include?('in') && hash['hgt'].delete_suffix('in').to_i >= 59 && 
        hash['hgt'].delete_suffix('in').to_i <= 76 ) && hash['hcl'].index('#') == 0 && hash['hcl'].length == 7 && hash['hcl'].delete("#abcdef0-9").empty? && 
        (hash['ecl'] == 'amb' || hash['ecl'] == 'blu' || hash['ecl'] == 'brn' || hash['ecl'] == 'gry' || hash['ecl'] == 'grn' || 
        hash['ecl'] == 'hzl' || hash['ecl'] == 'oth') && hash['pid'].length == 9 && hash['pid'].delete("0-9").empty?
          valids += 1
        end

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
