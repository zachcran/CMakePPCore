include(cmake_test/cmake_test)

ct_add_test("cpp_copy")
    include(cmakepp_core/algorithm/copy)
    include(cmakepp_core/algorithm/equal)

#    ct_add_section("Signature")
#        set(CMAKEPP_CORE_DEBUG_MODE ON)
#
#        ct_add_section("0th argument is desc")
#            cpp_copy(TRUE hi)
#            ct_assert_fails_as("Assertion: bool is convertible to desc failed.")
#        ct_end_section()
#
#        ct_add_section("Takes exactly 2 arguments.")
#            cpp_copy(result foo bar)
#            ct_assert_fails_as("Function takes 2 argument(s), but 3 was/were")
#        ct_end_section()
#    ct_end_section()

    ct_add_section("bool")
        set(lhs TRUE)
        cpp_copy(rhs "${lhs}")
        cpp_equal(result "${lhs}" "${rhs}")
        ct_assert_equal(result TRUE)
    ct_end_section()

    ct_add_section("descriptions")
        set(lhs "hello world")
        cpp_copy(rhs "${lhs}")
        cpp_equal(result "${lhs}" "${rhs}")
        ct_assert_equal(result TRUE)
    ct_end_section()

    ct_add_section("floats")
        set(lhs 3.14)
        cpp_copy(rhs "${lhs}")
        cpp_equal(result "${lhs}" "${rhs}")
        ct_assert_equal(result TRUE)
    ct_end_section()

    ct_add_section("ints")
        set(lhs 42)
        cpp_copy(rhs "${lhs}")
        cpp_equal(result "${lhs}" "${rhs}")
        ct_assert_equal(result TRUE)
    ct_end_section()

    ct_add_section("lists")
        set(lhs hello world)
        cpp_copy(rhs "${lhs}")
        cpp_equal(result "${lhs}" "${rhs}")
        ct_assert_equal(result TRUE)
    ct_end_section()

    ct_add_section("map")
        include(cmakepp_core/map/map)
        cpp_map(CTOR lhs a_key a_value foo bar)
        cpp_copy(rhs "${lhs}")
        cpp_equal(result "${lhs}" "${rhs}")
        ct_assert_equal(result TRUE)
    ct_end_section()

    ct_add_section("objects")
        include(cmakepp_core/object/object)

        cpp_copy(rhs "${__CPP_OBJECT_SINGLETON__}")
        cpp_equal(result "${__CPP_OBJECT_SINGLETON__}" "${rhs}")
        ct_assert_equal(result TRUE)
        ct_assert_not_equal(__CPP_OBJECT_SINGLETON__ "${rhs}")
    ct_end_section()

    ct_add_section("types")
        set(lhs int)
        cpp_copy(rhs "${lhs}")
        cpp_equal(result "${lhs}" "${rhs}")
        ct_assert_equal(result TRUE)
    ct_end_section()
ct_end_test()
