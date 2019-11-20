include(cmake_test/cmake_test)

ct_add_test("_cpp_array_are_equal")
    include(cmakepp_core/array/array)

    ct_add_section("LHS is empty")
        _cpp_array_ctor(lhs)
        ct_add_section("RHS is empty")
            _cpp_array_ctor(rhs)
            _cpp_array_are_equal(result "${lhs}" "${rhs}")
            ct_assert_equal(result TRUE)
        ct_end_section()

        ct_add_section("RHS is not empty")
            _cpp_array_ctor(rhs 1 2 3)
            _cpp_array_are_equal(result "${lhs}" "${rhs}")
            ct_assert_equal(result FALSE)
        ct_end_section()
    ct_end_section()

    ct_add_section("LHS is not empty")
        _cpp_array_ctor(lhs 1 2 3)
        ct_add_section("same instance")
            _cpp_array_are_equal(result "${lhs}" "${lhs}")
            ct_assert_equal(result TRUE)
        ct_end_section()

        ct_add_section("different instance, same value")
            _cpp_array_ctor(rhs 1 2 3)
            _cpp_array_are_equal(result "${lhs}" "${rhs}")
            ct_assert_equal(result TRUE)
        ct_end_section()

        ct_add_section("different order")
            _cpp_array_ctor(rhs 3 2 1)
            _cpp_array_are_equal(result "${lhs}" "${rhs}")
            ct_assert_equal(result FALSE)
        ct_end_section()

        ct_add_section("different lengths")
            _cpp_array_ctor(rhs 1 2)
            _cpp_array_are_equal(result "${lhs}" "${rhs}")
            ct_assert_equal(result FALSE)
        ct_end_section()

        ct_add_section("different values")
            _cpp_array_ctor(rhs 4 5 6)
            _cpp_array_are_equal(result "${lhs}" "${rhs}")
            ct_assert_equal(result FALSE)
        ct_end_section()
    ct_end_section()
ct_end_test()
