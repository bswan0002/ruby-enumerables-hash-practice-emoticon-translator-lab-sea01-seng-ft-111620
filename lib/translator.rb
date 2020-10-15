# require modules here
require 'yaml'

def load_library(filePath)
  emotiHash = YAML.load_file(filePath)
  newHash = {}
  
  emotiHash.each_key do |key|
    newHash[key] = {
      :english => emotiHash[key][0],
      :japanese => emotiHash[key][1]
    }
  end
  newHash
end

def get_japanese_emoticon(filePath, emoticon)
  tempHash = load_library(filePath)
  
  tempHash.select do |k|
    if tempHash[k][:english] == emoticon
      return tempHash.dig(k, :japanese)
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_english_meaning(filePath, emoticon)
  tempHash = load_library(filePath)
  
  englishMeaning = (tempHash.select { |k| tempHash[k][:japanese] == emoticon}).keys.join
  tempHash.include?(englishMeaning) ? englishMeaning : "Sorry, that emoticon was not found"
end