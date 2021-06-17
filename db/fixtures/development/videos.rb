stretch_youtube_ids = [
  'eQ03wzDG0wo',
  '5rdbmDoZNsw',
  'R-X9rWBBEIk',
  'izdNrxAnSKk',
  'sVsigSit94Q',
  'ASOzTmJ5Uyc',
  'LXzpn0jN8Bg',
  '80ko22iE6Pg',
  'BxpS6jw_2L4',
  'GlRcdEtmUfo',
]

yoga_youtube_ids = [
  'fJJrJ2dd1U4',
  'CtYD3EysPO8',
  'lJlbbbk3H_U',
  'kg5L2aIMOHg',
  'te3y-dU57Eg',
  'XD2xCQNV8KM',
  'sDCuD5gv_sw',
  'e9HR7-3I3MA',
  'gSpwZOzqbWI',
  '92xzvUVJvtA'
]

weight_training_youtube_ids = [
  'hge3fr50o0o',
  'iu80mxAyG9Q',
  'g46tZN9J_2k',
  'NwJiIWUIK1U',
  'm699OUYuuck',
  'fuMOxAZOlLI',
  'sM3W0b1PdOY',
  '6JIRtnZyqwA',
  'kcj40PNGgbQ',
  'qOiDlprXF2w',
  'pBo_DjHqVws'
]

dance_youtube_ids = [
  'e1VC2lgTWes',
  'KxzZJwmB8qc',
  'yPbQ1tpvt3Y',
  'TEaxeWFVW_8',
  'yjOmSzemOUQ',
  '5qI7ACN6s3c',
  'ngnJdgzBT4w',
  'lm_qq2rLvrI',
  'QLDhmFj2uFM',
  'NNmdlrsJB1c'
]

stretch_youtube_ids.each do |youtube_id|
  Video.seed(:youtube_id) do |s|
    s.youtube_id = youtube_id
    s.category = 'stretch'
  end
end

yoga_youtube_ids.each do |youtube_id|
  Video.seed(:youtube_id) do |s|
    s.youtube_id = youtube_id
    s.category = 'yoga'
  end
end

weight_training_youtube_ids.each do |youtube_id|
  Video.seed(:youtube_id) do |s|
    s.youtube_id = youtube_id
    s.category = 'weight_training'
  end
end

dance_youtube_ids.each do |youtube_id|
  Video.seed(:youtube_id) do |s|
    s.youtube_id = youtube_id
    s.category = 'dance'
  end
end
