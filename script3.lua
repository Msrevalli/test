-- Function to reverse a string
function Reverse_String(string1)
    -- Check if the input is a string
    if type(string1) ~= "string" then
        return nil  -- Return nil for non-string inputs
    end

    -- Initialize an empty table to store characters in reverse order
    local reverse_chars = {}
    -- Iterate over each character of the input string in reverse order
    for ch = #string1, 1, -1 do
        -- Insert each character into the table
        table.insert(reverse_chars, string.sub(string1, ch, ch))
    end

    -- Concatenate characters to form the reversed string
    return table.concat(reverse_chars)
end

-- Table containing test cases with combination inputs and their expected reversed outputs
combination_test_values = {
    {input = "hello", expected = "olleh"},
    {input = "Lua is great", expected = "taerg si auL"},
    {input = "", expected = ""},
    {input = "12345", expected = "54321"},
    {input = "!@#$%", expected = "%$#@!"},
    -- Additional combination test cases
    {input = 123, expected = nil},  -- Input is a number
    {input = {1, 2, 3}, expected = nil},  -- Input is a table
    {input = true, expected = nil},  -- Input is a boolean
    {input = function() return "hello" end, expected = nil},  -- Input is a function
    {input = "combination123", expected = "321noitanibmoc"}, -- Input is a combination of string and number
    {input = "mixed!@#", expected = "#@!dexim"}, -- Input is a combination of string and special characters
    {input = "123mixed", expected = "dexim321"}, -- Input is a combination of number and string
    {input = "mixed_table", expected = "elbatxedim"}, -- Input is a combination of string and table
}

-- Iterate over each test case
for i, values in ipairs(combination_test_values) do
    local input1 = values.input  -- Get the input value from the test case
    local expected1 = values.expected  -- Get the expected reversed output from the test case
    local actual = Reverse_String(input1)  -- Call the Reverse_String function with the input value

    -- Compare the actual reversed output with the expected output
    if expected1 == actual then
        -- Print a message indicating that the test case passed
        print(string.format("Test case %d passed with Input = '%s' -----> reverse = '%s'", i, tostring(input1), tostring(actual)))
    else
        -- Print a message indicating that the test case failed
        print(string.format("Test case %d failed with Input = '%s' -----> reverse = '%s' and expected = '%s'", i, tostring(input1), tostring(actual), tostring(expected1)))
    end
end
