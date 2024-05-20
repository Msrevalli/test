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

-- Test cases with varying values
local test_cases = {
    -- Basic Test Cases
    { little = 0x01234567, big = 0x67452301 },
    { little = 0x87654321, big = 0x21436587 },

    -- Boundary Cases
    { little = 0x00000000, big = 0x00000000 },
    { little = 0xFFFFFFFF, big = 0xFFFFFFFF },

    -- Edge Cases
    { little = 0x00000001, big = 0x01000000 },
    { little = 0x00000100, big = 0x00010000 },
    { little = 0x00010000, big = 0x00000100 },
    { little = 0x01000000, big = 0x00000001 },
    { little = 0x12345678, big = 0x78563412 },
    { little = 0xABCDEF01, big = 0x01EFCDAB }
}

-- Functional Tests
print("=== Functional Tests ===")
for i, value in ipairs(test_cases) do
    local little = value.little
    local expectedBig = value.big
    local actualBig = LittleEndian_to_BigEndian(little)

    if actualBig == expectedBig then
        print(string.format("Test case %d passed: 0x%08X -----> 0x%08X", i, little, actualBig))
    else
        error(string.format("Test case %d failed: 0x%08X -----> Expected 0x%08X, Got 0x%08X", i, little, expectedBig, actualBig))
    end
end

-- Operational Tests (Error Handling)
print("=== Operational Tests ===")
-- Test with non-integer input
local nonIntegerInput = "hello"
local success, result = pcall(LittleEndian_to_BigEndian, nonIntegerInput)
if success then
    error(string.format("Error: Operational test failed. Expected error, but got result: %s", tostring(result)))
else
    print("Operational test passed: Function correctly handled non-integer input.")
end

-- Robustness Tests (Boundary and Edge Cases)
print("=== Robustness Tests ===")
for i, value in ipairs(test_cases) do
    local little = value.little
    local expectedBig = value.big
    local actualBig = LittleEndian_to_BigEndian(little)

    if actualBig == expectedBig then
        print(string.format("Robustness Test case %d passed: 0x%08X -----> 0x%08X", i, little, actualBig))
    else
        error(string.format("Robustness Test case %d failed: 0x%08X -----> Expected 0x%08X, Got 0x%08X", i, little, expectedBig, actualBig))
    end
end

print("All tests completed.")