function cppcheck
    set USE_SUPPRESS_LIST true

    if test "$USE_SUPPRESS_LIST" = true
        set suppress_list \
            --suppress=AssignmentIntegerToAddress \
            --suppress=arrayIndexOutOfBounds \
            --suppress=arrayIndexOutOfBoundsCond \
            --suppress=assignBoolToPointer \
            --suppress=autoVariables \
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
            --suppress=duplicateExpression \
            --suppress=internalAstError \
            --suppress=invalidLifetime \
            --suppress=invalidPointerCast \
            --suppress=invalidPrintfArgType_sint \
            --suppress=invalidPrintfArgType_uint \
            --suppress=knownConditionTrueFalse \
            --suppress=legacyUninitvar \
            --suppress=missingReturn \
            --suppress=moduloofone \
            --suppress=multiCondition \
            --suppress=nanInArithmeticExpression \
            --suppress=negativeIndex \
            --suppress=noCopyConstructor \
            --suppress=noExplicitConstructor \
            --suppress=noOperatorEq \
            --suppress=nullPointer \
            --suppress=nullPointerRedundantCheck \
            --suppress=objectIndex \
            --suppress=oppositeInnerCondition \
            --suppress=passedByValue \
            --suppress=pointerOutOfBoundsCond \
            --suppress=preprocessorErrorDirective \
            --suppress=redundantAssignment \
            --suppress=redundantCondition \
            --suppress=redundantContinue \
            --suppress=redundantInitialization \
            --suppress=redundantPointerOp \
            --suppress=returnDanglingLifetime \
            --suppress=shadowFunction \
            --suppress=shadowVariable \
            --suppress=signConversion \
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
            --suppress=unusedLabelConfiguration \
            --suppress=unusedPrivateFunction \
            --suppress=unusedStructMember \
            --suppress=unusedVariable \
            --suppress=useInitializationList \
            --suppress=useStlAlgorithm \
            --suppress=uselessAssignmentPtrArg \
            --suppress=variableScope \
            --suppress=wrongPrintfScanfArgNum \
            --suppress=zerodiv \
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

    command cppcheck \
    --project=compile_commands.json \
    --enable=all \
    --disable=unusedFunction \
    --suppress=missingIncludeSystem \
    --suppress=missingInclude \
    $suppress_list \
    --check-level=exhaustive \
    --quiet \
    # --file-filter='*vterm*' \
    -j$cores $flags $argv
end
