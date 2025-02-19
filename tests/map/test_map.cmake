include(cmake_test/cmake_test)

ct_add_test(NAME "test_cpp_map")
function("${test_cpp_map}")
    include(cmakepp_lang/map/map)

    ct_add_section(NAME "append")
    function("${append}")
        cpp_map(CTOR a_map foo bar)
        cpp_map(APPEND "${a_map}" foo 42)
        cpp_map(CTOR corr foo bar)
        cpp_map_append("${corr}" foo 42)
        cpp_map_equal("${corr}" result "${a_map}")
        ct_assert_equal(result TRUE)
    endfunction()

    ct_add_section(NAME "copy")
    function("${copy}")
        cpp_map(CTOR a_map foo bar)
        cpp_map(COPY "${a_map}" other)
        cpp_map_equal("${other}" result "${a_map}")
        ct_assert_equal(result TRUE)
    endfunction()

    ct_add_section(NAME "ctor")
    function("${ctor}")
        ct_add_section(NAME "no_initial_state")
        function("${no_initial_state}")
            cpp_map(CTOR a_map)
            cpp_map_ctor(corr)
            cpp_map_equal("${a_map}" result "${corr}")
            ct_assert_equal(result TRUE)
        endfunction()

        ct_add_section(NAME "with_initial_state")
        function("${with_initial_state}")
            cpp_map(CTOR a_map foo bar)
            cpp_map_ctor(corr foo bar)
            cpp_map_equal("${a_map}" result "${corr}")
            ct_assert_equal(result TRUE)
        endfunction()
    endfunction()

    ct_add_section(NAME "equal")
    function("${equal}")
        cpp_map(CTOR a_map foo bar)
        cpp_map(CTOR other)
        cpp_map(EQUAL "${a_map}" result "${other}")
        ct_assert_equal(result FALSE)
    endfunction()

    ct_add_section(NAME "get")
    function("${get}")
        cpp_map(CTOR a_map foo bar)
        cpp_map(GET "${a_map}" result foo)
        ct_assert_equal(result bar)
    endfunction()

    ct_add_section(NAME "has_key")
    function("${has_key}")
        cpp_map(CTOR a_map foo bar)
        cpp_map(HAS_KEY "${a_map}" result foo)
        ct_assert_equal(result TRUE)
    endfunction()

    ct_add_section(NAME "keys")
    function("${keys}")
        cpp_map(CTOR a_map foo bar)
        cpp_map(KEYS "${a_map}" map_keys)
        ct_assert_equal(map_keys foo)
    endfunction()

    ct_add_section(NAME "set")
    function("${set}")
        cpp_map(CTOR a_map foo bar)
        cpp_map(SET "${a_map}" foo 42)
        cpp_map(GET "${a_map}" result foo)
        ct_assert_equal(result 42)
    endfunction()
endfunction()
