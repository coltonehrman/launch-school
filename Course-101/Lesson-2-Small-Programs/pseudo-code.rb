# Program Description:
# a method that returns the sum of two integers
#
#####################
# PSEUDO-CODE:
#####################
# Get the two integers from user
# If either integers are not valid
#   - return nil
# Otherwise add the integers together
#   - return result
#
#####################
# FORMAL PSEUDO-CODE:
#####################
# START
#
# GET integer_one
# GET integer_two
#
# IF integer_one || integer_two are not integers
#   PRINT "You need to input valid Integers"
# ELSE
#   SET result = integer_one + integer_two
#
# PRINT result
#
# END
#####################


# Program Description:
# a method that takes an array of strings,
# and returns a string that is all those strings concatenated together
#
#####################
# PSEUDO-CODE:
#####################
# If input is not an array
#   - Return nil
# Otherwise save an empty string for end result
# Iterate through Strings in array
#   - Concat string to the end of result
# Return result
#
#####################
# FORMAL PSEUDO-CODE:
#####################
# START
#
# SET result = ""
# SET iterator = 0
#
# IF input is not an array
#   PRINT "You need to input an Array"
# ELSE
#   WHILE iterator < number of elements in input
#     result = result + string at iterator position in input
#
# PRINT result
#
# END
#####################


# Program Description:
# a method that takes an array of integers,
# and returns a new array with every other element
#
#####################
# PSEUDO-CODE:
#####################
# If input is not an array
#   - Return nil
# Otherwise save an array for end result
# Iterate through Integers in array
#   - If Integer is an odd index
#     - add it to the result
# Return result
#
#####################
# FORMAL PSEUDO-CODE:
#####################
# START
#
# SET result = []
# SET iterator = 0
#
# IF input is not an array
#   PRINT "You need to input an Array"
# ELSE
#   WHILE iterator < number of elements in input
#     IF iterator is odd
#       add element to result
#
# PRINT result
#
# END
#####################
