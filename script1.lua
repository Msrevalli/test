-- Function to convert little-endian hexadecimal string to big-endian
function littleToBigEndian(little)
    -- Check if the input is a valid hexadecimal string of 32 bits (8 hex digits)
    if type(little) ~= "string" or not little:match("^0x[0-9A-Fa-f]+$") then
        return nil -- Return nil for invalid input
    end

    -- Remove the "0x" prefix
    local hex = little:sub(3)

    -- Ensure the hex string length is exactly 8 characters (32 bits)
    if #hex ~= 8 then
        return nil -- Return nil for invalid length
    end

    -- Reverse the byte order
    local big = ""
    for i = #hex, 1, -2 do
        big = big .. hex:sub(i - 1, i)
    end

    -- Return the big-endian representation with "0x" prefix
    return "0x" .. big
end

-- Test data containing normal cases, boundary conditions, and non-hex input data
test_data = {
    {little = "0x01234567", big = "0x67452301"}, -- Normal test case
    {little = "0x87654321", big = "0x21436587"}, -- Normal test case
    {little = "0x89ABCDEF", big = "0xEFCDAB89"}, -- Normal test case
    {little = "0xABCDEF01", big = "0x01EFCDAB"}, -- Normal test case
    {little = "0x00000000", big = "0x00000000"}, -- Boundary condition: All zeros
    {little = "0xFFFFFFFF", big = "0xFFFFFFFF"}, -- Boundary condition: All ones
    {little = "0x100000000" , big = nil}, -- Boundary condition: Invalid length
    {little = "0xFFFFFFFFFF", big = nil}, -- Boundary condition: Invalid length
    {little = "abc", big = nil},  -- Non-hex input data
    {little = "123abc", big = nil},  -- Non-hex input data
    {little = "12345678", big = nil}, -- Non-hex input data
    {little = true, big = nil}, -- Non-hex input data
    {little = {}, big = nil}, -- Non-hex input data
    {little = nil, big = nil}, -- Non-hex input data
    {little = 123.456, big = nil}, -- Non-hex input data: Float
    {little = math.huge, big = nil}, -- Non-hex input data: Infinity
    {little = -math.huge, big = nil}, -- Non-hex input data: Negative infinity
    {little = 0/0, big = nil}, -- Non-hex input data: NaN
    {little = "", big = nil}, -- Non-hex input data: Empty string
    {little = "0x", big = nil}, -- Non-hex input data: Hex prefix only
    {little = "0xzz", big = nil}, -- Non-hex input data: Invalid hex characters
    {little = "123456789", big = nil}, -- Non-hex input data: More than 8 hex characters
}

-- Iterate over test data and print results
for _, case in ipairs(test_data) do
    -- Format input value for printing
    local little_str = type(case.little) == "table" and "table: " .. tostring(case.little) or tostring(case.little)
    -- Call littleToBigEndian function and get the result
    local result = littleToBigEndian(case.little)
    -- Print the test case details along with expected and actual results
    print(string.format("little: %s, expected big: %s, result: %s", little_str, tostring(case.big), tostring(result)))
end
