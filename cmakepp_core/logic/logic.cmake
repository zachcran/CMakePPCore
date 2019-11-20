include_guard()
include(cmakepp_core/logic/are_equal)
include(cmakepp_core/utilities/return)

function(cpp_logic _cl_result _cl_lhs _cl_op _cl_rhs)
    if("${_cl_op}" STREQUAL "==")
        cpp_are_equal("${_cl_result}" "${_cl_lhs}" "${_cl_rhs}")
    elseif("${_cl_op}" STREQUAL "!=")
        cpp_are_equal("${_cl_result}" "${_cl_lhs}" "${_cl_rhs}")
        cpp_negate("${_cl_result}")
    endif()
    cpp_return("${_cl_result}")
endfunction()
