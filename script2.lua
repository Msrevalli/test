-- Function to convert a floating-point number to its hexadecimal representation
function float2hex(float)
    -- Pack the floating-point number into a binary string
    local s = string.pack("f", float)
    -- Unpack the binary string as a signed integer
    local h = string.unpack("i", s)
    -- Format the integer as a hexadecimal string prefixed with "0x"
    return string.format("0x%X", h)
end

-- List of test values
local test_values = {
    2.296883,
    3.14159265359,
    0.123456789,
    -1.23456789,
    42.0,
    0.0,
    1.0,
    -0.5,
    123456.789,
    -987654.321
}

-- Iterate over test values and print their hexadecimal representations
for i, value in ipairs(test_values) do
    -- Get the hexadecimal representation of the current value
    local hex_representation = float2hex(value)
    -- Print the test number, the original float value, and its hexadecimal representation
    print(string.format("Test %d: %.6f -> %s", i, value, hex_representation))
end
