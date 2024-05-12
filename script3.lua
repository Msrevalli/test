-- Function to reverse a string
function Reverse_String(string1)
    local reverse_string = ""  -- Initialize an empty string to store the reversed string
    for ch = #string1, 1, -1 do  -- Iterate over each character of the input string in reverse order
        reverse_string = reverse_string .. string.sub(string1, ch, ch)  -- Append each character to the reversed string
    end
    return reverse_string  -- Return the reversed string
end

-- Table containing test cases with input strings and their expected reversed outputs
test_values = {
    {input = "hello", expected = "olleh"},
    {input = "Lua is great", expected = "taerg si auL"},
    {input = "", expected = ""},
    {input = "12345", expected = "54321"},
    {input = "!@#$%", expected = "%$#@!"},
}

-- Iterate over each test case
for i, values in ipairs(test_values) do
    local input1 = values.input  -- Get the input string from the test case
    local expected1 = values.expected  -- Get the expected reversed output from the test case
    local actual = Reverse_String(input1)  -- Call the Reverse_String function with the input string
    if expected1 == actual then  -- Compare the actual reversed output with the expected output
        -- Print a message indicating that the test case passed along with the input string and the actual reversed output
        print(string.format("Test case %d passed with Input = '%s' -----> reverse = '%s'", i, input1, actual))
    else
        -- Print a message indicating that the test case failed along with the input string, the actual reversed output, and the expected output
        print(string.format("Test case %d failed with Input = '%s' -----> reverse = '%s' and expected = '%s'", i, input1, actual, expected1))
    end
end
