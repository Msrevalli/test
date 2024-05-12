-- Function to convert little endian data to big endian
function LittleEndian_to_BigEndian(LittleEndian)
    -- Extract individual bytes and shift them to appropriate positions
    local byte0 = (LittleEndian & 0xFF) << 24
    local byte1 = (LittleEndian & 0xFF00) << 8
    local byte2 = (LittleEndian & 0xFF0000) >> 8
    local byte3 = (LittleEndian & 0xFF000000) >> 24
    
    -- Combine the bytes to form the big endian representation
    return byte3 | byte2 | byte1 | byte0
end

-- Test data containing little endian and corresponding big endian values
test_data = {
    {little = 0x01234567, big = 0x67452301 },
    {little = 0x87654321, big = 0x21436587},
    {little = 0x89ABCDEF, big = 0xEFCDAB89},
    {little = 0xABCDEF01, big = 0x01EFCDAB}
}

-- Loop over each test case in the test data
for i, value in ipairs(test_data) do
    -- Extract little endian and expected big endian values from the test case
    local little = value.little
    local ActualBig = value.big
    local ExpectedBig = LittleEndian_to_BigEndian(little)
    
    -- Compare actual and expected big endian values and print result
    if ActualBig == ExpectedBig then
        print(string.format("Test case %d is passed with 0X%08X -----> 0X%08X ", i, little, ActualBig))
    else
        print(string.format("Test case %d is failed  0X%08X -----> 0X%08X , But expected=0X%08X", i, little, ActualBig, ExpectedBig))
    end
end
