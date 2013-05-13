#
# Shannon Entropy algorithm
#

# ///////////////////////////////////////////
# Public methods
# ///////////////////////////////////////////

#
# Returns an objects with the column as the key
# and the entropy in bits as the value
#
exports.calculateEntropy = (items, columns, callback) ->
  entropy = {}

  # loop through each column
  i = 0
  while i < columns.length
    column = columns[i]
    entropy[column] = entropyOfColumn(items, column)
    i++

  callback entropy

# ///////////////////////////////////////////
# Provate methods
# ///////////////////////////////////////////

#
# Returns the entropy of a single column
#
entropyOfColumn = (items, column) ->
  distinct = distinctValuesOfColumn(items, column)

  total = items.length

  sumEntropy = 0
  for key of distinct
    count = distinct[key]
    sumEntropy += entropy(count, total)

  #(-sumEntropy)*total
  -sumEntropy

# //////////////////////////////////////

#
# Returns distinct column values and their count
# as an hash
#
distinctValuesOfColumn = (items, column) ->
  distinct = {}
  i = 0
  while i < items.length
    item = items[i]
    value = item[column]

    if value instanceof Array
      value = value.join("|")

    if typeof (distinct[value]) isnt "undefined"
      distinct[value] = distinct[value] + 1
    else
      distinct[value] = 1

    i++

  distinct

# //////////////////////////////////////

#
# Calculates the entropy
# Entropy = -sum(p(a)*log2(p(a)))
#
entropy = (num, total) ->
  p = num/total
  p*log2(p)

# //////////////////////////////////////

#
# Calculates log2 of n
#
log2 = (n) ->
  Math.log(n) / Math.log(2)


# //////////////////////////////////////

#
# Calculates the sum of an array of values
#
calculateSum = (items) ->
  sum = 0
  i = 0

  while i < items.length
    sum += items[i]
    i++
  sum
