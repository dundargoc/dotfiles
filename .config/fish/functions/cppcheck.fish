function cppcheck
    set USE_SUPPRESS_LIST true

    if test "$USE_SUPPRESS_LIST" = true
        set suppress_list \
            --suppress=AssignmentIntegerToAddress \
            --suppress=arrayIndexOutOfBoundsCond \
            --suppress=assignBoolToPointer \
            --suppress=checkLevelNormal \
            --suppress=clarifyCalculation \
            --suppress=compareBoolExpressionWithInt \
            --suppress=constParameter \
            --suppress=constParameterCallback \
            --suppress=constParameterPointer \
            --suppress=constParameterReference \
            --suppress=constVariable \
            --suppress=constVariablePointer \
            --suppress=constVariableReference \
            --suppress=cstyleCast \
            --suppress=duplicateBreak \
            --suppress=duplicateCondition \
            --suppress=internalAstError \
            --suppress=invalidLifetime \
            --suppress=invalidPointerCast \
            --suppress=invalidPrintfArgType_sint \
            --suppress=invalidPrintfArgType_uint \
            --suppress=knownConditionTrueFalse \
            --suppress=legacyUninitvar \
            --suppress=missingReturn \
            --suppress=moduloofone \
            --suppress=nullPointer \
            --suppress=nullPointerRedundantCheck \
            --suppress=objectIndex \
            --suppress=preprocessorErrorDirective \
            --suppress=redundantAssignment \
            --suppress=redundantInitialization \
            --suppress=redundantPointerOp \
            --suppress=returnDanglingLifetime \
            --suppress=shadowFunction \
            --suppress=sizeofDivisionMemfunc \
            --suppress=sizeofwithnumericparameter \
            --suppress=syntaxError \
            --suppress=truncLongCastAssignment \
            --suppress=uninitMemberVar \
            --suppress=uninitStructMember \
            --suppress=uninitvar \
            --suppress=unknownEvaluationOrder \
            --suppress=unreachableCode \
            --suppress=unreadVariable \
            --suppress=unsignedLessThanZero \
            --suppress=unusedStructMember \
            --suppress=uselessAssignmentPtrArg \
            --suppress=wrongPrintfScanfArgNum \
            --suppress=zerodivcond
    end

    set repo_path (git rev-parse --show-toplevel)
    reset

    if test (uname) = Darwin
        set cores (sysctl -n hw.logicalcpu)
    else
        set cores (nproc)
    end

    if [ $repo_path = $HOME/programs/uncrustify ]
        set flags --std=c++11
    else if [ $repo_path = $HOME/programs/neovim ]
        set flags --std=c99
    else if [ $repo_path = $HOME/programs/vim ]
        set flags --std=c99
    end

    command cppcheck --project=compile_commands.json --enable=all --disable=unusedFunction --suppress=missingIncludeSystem --suppress=missingInclude \
        $suppress_list --quiet -j$cores $flags $argv
end
