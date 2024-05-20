-- Function to convert a single-precision floating-point number to its hexadecimal representation (32-bit)
function float2hex(float)
    -- Define a small epsilon for floating-point comparison
    local epsilon = 1e-5
    
    -- Check if the input is a number
    if type(float) == "number" then
        -- Ensure the number is within the range of single-precision floating-point numbers
        if float > 3.4028235e38 or float < -3.4028235e38 or (math.abs(float) < 1.401298464e-45 and float ~= 0) then
            return nil
        end

        -- Pack the single-precision floating-point number into a binary string
        local s = string.pack("f", float)
        -- Unpack the binary string as a 32-bit unsigned integer
        local h = string.unpack("I4", s)
        -- Convert back to float to check if the value can be accurately represented
        local single_precision = string.unpack("f", s)
        
        -- Allow for a small difference due to floating-point precision issues
        if math.abs(single_precision - float) > epsilon then
            return nil
        end
        
        -- Format the integer as a hexadecimal string prefixed with "0x"
        return string.format("0x%08X", h)
    else
        -- Return nil if the input is not a number
        return nil
    end
end

-- List of test values
local test_values = {
    -- Floating-point numbers
    math.pi,               -- Standard constant
    math.huge,             -- Positive infinity
    -math.huge,            -- Negative infinity
    0,                     -- Zero
    -0,                    -- Negative zero
    3.4028235e38,          -- Maximum positive single-precision float
    -3.4028235e38,         -- Minimum negative single-precision float
    1.401298464e-45,       -- Smallest positive single-precision float
    -1.401298464e-45,      -- Smallest negative single-precision float
    math.sqrt(2),          -- Square root of 2
    1.23456789e10,         -- Scientific notation (large positive)
    -1.23456789e-10,       -- Scientific notation (small negative)
    1.0 / 3.0,             -- Rational number
    -1.0 / 3.0,            -- Negative rational number
    123.456789,            -- Arbitrary positive value
    -123.456789,           -- Arbitrary negative value,
    
    -- Integers
    2147483649,            -- Value larger than 32-bit range
    42,                    -- Standard integer
    -987654321,            -- Negative integer
    0xABCDEF,              -- Hexadecimal integer
    tonumber("101010", 2), -- Binary integer (converted to decimal)
    
    -- Strings
    "Hello, world!",       -- Regular string
    "",                    -- Empty string
}

-- Iterate over test values and print their representations
for i, value in ipairs(test_values) do
    local hex_representation
    
    -- Call float2hex function for numbers only
    if type(value) == "number" then
        hex_representation = float2hex(value)
    else
        hex_representation = nil
    end
    
    -- Print the test number, the original value, and its hexadecimal representation
    print(string.format("Test %d: %s -> %s", i, tostring(value), tostring(hex_representation)))
end
