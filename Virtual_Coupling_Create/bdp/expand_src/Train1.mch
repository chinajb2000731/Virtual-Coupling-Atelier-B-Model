/* Train1
 * Author: ASUS
 * Creation date: 2022/1/11
 */
MACHINE
    Train1
SEES
    Context
SETS
    Flag_train1_getinfor_train2 = { train1_get_train2_infor , train1_no_get_train2_infor } ;
    Flag_train1_connect_RMU = { train1_get_RMU_infor , train1_no_get_RMU_infor } ;
    Flag_train1_get_train3_request = { train1_receive_train3 , trian1_no_receive_train3 } ;
    Flag_train1_check_train3_request = { train1_find_request_error , train1_confirm_request } ;
    Flag_train1_confirm_train3_request = { train1_confirm_train3_request , train1_on_confirm_train3_request } ;
    Flag_train1_estab_train3 = { train1_estab_train3 , train1_no_estab_train3 } ;
    Flag_train1_getinfor_train3 = { train1_get_train3_infor , train1_no_get_train3_infor } ;
    Flag_train1_termination = { termination , no_termination } ;

    Flag_train1_receive_train3_VCre = { receive_train3_VCre , no_receive_train3_VCre } ;
    Flag_train1_check_train3_VCre = { train3_VCre_error , train3_VCre_noerror } ;
    Flag_train1_confirm_train3_VCre = { train3_confirm_train1_VCre , train3_no_confirm_train1_VCre } ;
    Flag_train1_analyze_VC = { train3_suitable , train3_not_suitable } ;
    Flag_train1_VC_terminationcmd = { VCterminated , not_VCterminated } ;
    Flag_train1_analyze_acdc = { train1_analyze , train1_not_analyze } ;

    Flag_train1_wait_VC = { train1_wait_VCcomplete , train1_nowait_VCcomplete } ;

    Flag_train1_confirm_train3completeVCinfor = { train1_conf_train3completeVCinfor , train1_no_conf_train3completeVCinfor } ;
    Flag_train1_informRMU = { train1_maintainVC , train1_no_maintainVC }
ABSTRACT_VARIABLES
    flag_train1_com ,
    flag_train1_VC ,
    flag_train1_AnVC ,
    flag_train1_operation ,
    flag_train1_getinfor_train2 ,
    flag_train1_connect_RMU ,
    flag_train1_get_train3_request ,
    flag_train1_check_train3_request ,
    flag_train1_confirm_train3_request ,
    flag_train1_estab_train3 ,
    flag_train1_getinfor_train3 ,
    flag_train1_termination ,

    flag_train1_receive_train3_VCre ,
    flag_train1_check_train3_VCre ,
    flag_train1_confirm_train3_VCre ,
    flag_train1_analyze_VC ,
    flag_train1_VC_terminationcmd ,
    flag_train1_analyze_acdc ,

    flag_train1_wait_VC ,

    flag_train1_confirm_train3completeVCinfor ,
    flag_train1_informRMU
INVARIANT
    flag_train1_com : BOOL &
    flag_train1_VC : BOOL &
    flag_train1_AnVC : BOOL &
    flag_train1_operation : TRAIN_OPERATION &
    flag_train1_getinfor_train2 : Flag_train1_getinfor_train2 &
    flag_train1_connect_RMU : Flag_train1_connect_RMU &
    flag_train1_get_train3_request : Flag_train1_get_train3_request &
    flag_train1_check_train3_request : Flag_train1_check_train3_request &
    flag_train1_confirm_train3_request : Flag_train1_confirm_train3_request &
    flag_train1_estab_train3 : Flag_train1_estab_train3 &
    flag_train1_getinfor_train3 : Flag_train1_getinfor_train3 &
    flag_train1_termination : Flag_train1_termination &

    flag_train1_receive_train3_VCre : Flag_train1_receive_train3_VCre &
    flag_train1_check_train3_VCre : Flag_train1_check_train3_VCre &
    flag_train1_confirm_train3_VCre : Flag_train1_confirm_train3_VCre &
    flag_train1_analyze_VC : Flag_train1_analyze_VC &
    flag_train1_VC_terminationcmd : Flag_train1_VC_terminationcmd &
    flag_train1_analyze_acdc : Flag_train1_analyze_acdc &

    flag_train1_wait_VC : Flag_train1_wait_VC &

    flag_train1_confirm_train3completeVCinfor : Flag_train1_confirm_train3completeVCinfor &
    flag_train1_informRMU : Flag_train1_informRMU
INITIALISATION
    flag_train1_com := TRUE ||
    flag_train1_VC := TRUE ||
    flag_train1_AnVC := TRUE ||
    flag_train1_operation := normally ||
    flag_train1_getinfor_train2 := train1_no_get_train2_infor ||
    flag_train1_connect_RMU := train1_no_get_RMU_infor ||
    flag_train1_get_train3_request := trian1_no_receive_train3 ||
    flag_train1_check_train3_request := train1_find_request_error ||
    flag_train1_confirm_train3_request := train1_on_confirm_train3_request ||
    flag_train1_estab_train3 := train1_no_estab_train3 ||
    flag_train1_getinfor_train3 := train1_no_get_train3_infor ||
    flag_train1_termination := no_termination ||

    flag_train1_receive_train3_VCre := no_receive_train3_VCre ||
    flag_train1_check_train3_VCre := train3_VCre_error ||
    flag_train1_confirm_train3_VCre := train3_no_confirm_train1_VCre ||
    flag_train1_analyze_VC := train3_not_suitable ||
    flag_train1_VC_terminationcmd := not_VCterminated ||
    flag_train1_analyze_acdc := train1_not_analyze ||

    flag_train1_wait_VC := train1_nowait_VCcomplete ||

    flag_train1_confirm_train3completeVCinfor := train1_no_conf_train3completeVCinfor ||
    flag_train1_informRMU := train1_no_maintainVC
OPERATIONS
    change_flag_train1_operation ( input ) =
    PRE
        input : TRAIN_OPERATION
    THEN
        flag_train1_operation := input
    END ;
    //
    change_flag_train1_getinfor_train2 ( input ) =
    PRE
        input : Flag_train1_getinfor_train2
    THEN
        flag_train1_getinfor_train2 := input
    END ;
    //
    change_flag_train1_connect_RMU ( input ) =
    PRE
        input : Flag_train1_connect_RMU
    THEN
        flag_train1_connect_RMU := input
    END ;
    //
    change_flag_train1_get_train3_request ( input ) =
    PRE
        input : Flag_train1_get_train3_request
    THEN
        flag_train1_get_train3_request := input
    END ;
    //
    change_flag_train1_check_train3_request ( input ) =
    PRE
        input : Flag_train1_check_train3_request
    THEN
        flag_train1_check_train3_request := input
    END ;
    //
    change_flag_train1_confirm_train3_request ( input ) =
    PRE
        input : Flag_train1_confirm_train3_request
    THEN
        flag_train1_confirm_train3_request := input
    END ;
    //
    change_flag_train1_estab_train3 ( input ) =
    PRE
        input : Flag_train1_estab_train3
    THEN
        flag_train1_estab_train3 := input
    END ;
    //
    change_flag_train1_getinfor_train3 ( input ) =
    PRE
        input : Flag_train1_getinfor_train3
    THEN
        flag_train1_getinfor_train3 := input
    END ;
    //
    change_flag_train1_termination ( input ) =
    PRE
        input : Flag_train1_termination
    THEN
        flag_train1_termination := input
    END ;
    //
    change_flag_train1_receive_train3_VCre ( input ) =
    PRE
        input : Flag_train1_receive_train3_VCre
    THEN
        flag_train1_receive_train3_VCre := input
    END ;
    //
    change_flag_train1_check_train3_VCre ( input ) =
    PRE
        input : Flag_train1_check_train3_VCre
    THEN
        flag_train1_check_train3_VCre := input
    END ;
    //
    change_flag_train1_confirm_train3_VCre ( input ) =
    PRE
        input : Flag_train1_confirm_train3_VCre
    THEN
        flag_train1_confirm_train3_VCre := input
    END ;
    //
    change_flag_train1_analyze_VC ( input ) =
    PRE
        input : Flag_train1_analyze_VC
    THEN
        flag_train1_analyze_VC := input
    END ;
    //
    change_flag_train1_VC_terminationcmd ( input ) =
    PRE
        input : Flag_train1_VC_terminationcmd
    THEN
        flag_train1_VC_terminationcmd := input
    END ;
    //
    change_flag_train1_analyze_acdc ( input ) =
    PRE
        input : Flag_train1_analyze_acdc
    THEN
        flag_train1_analyze_acdc := input
    END ;
    //
    change_flag_train1_wait_VC ( input ) =
    PRE
        input : Flag_train1_wait_VC
    THEN
        flag_train1_wait_VC := input
    END ;
    //
    change_flag_train1_confirm_train3completeVCinfor ( input ) =
    PRE
        input : Flag_train1_confirm_train3completeVCinfor
    THEN
        flag_train1_confirm_train3completeVCinfor := input
    END ;
    //
    change_flag_train1_informRMU ( input ) =
    PRE
        input : Flag_train1_informRMU
    THEN
        flag_train1_informRMU := input
    END ;

    change_flag_train1_com_false = flag_train1_com := FALSE ;
    change_flag_train1_com_true = flag_train1_com := TRUE ;
    change_flag_train1_VC_false = flag_train1_VC := FALSE ;
    change_flag_train1_VC_true = flag_train1_VC := TRUE ;
    change_flag_train1_AnVC_false = flag_train1_AnVC := FALSE ;
    change_flag_train1_AnVC_true = flag_train1_AnVC := TRUE ;
    ////////////////////////////////////////////////
    output <-- get_flag_train1_com = output := flag_train1_com ;
    output <-- get_flag_train1_VC = output := flag_train1_VC ;
    output <-- get_flag_train1_AnVC = output := flag_train1_AnVC ;
    output <-- get_flag_train1_operation = output := flag_train1_operation ;
    output <-- get_flag_train1_getinfor_train2 = output := flag_train1_getinfor_train2 ;
    output <-- get_flag_train1_connect_RMU = output := flag_train1_connect_RMU ;
    output <-- get_flag_train1_get_train3_request = output := flag_train1_get_train3_request ;
    output <-- get_flag_train1_check_train3_request = output := flag_train1_check_train3_request ;
    output <-- get_flag_train1_confirm_train3_request = output := flag_train1_confirm_train3_request ;
    output <-- get_flag_train1_estab_train3 = output := flag_train1_estab_train3 ;
    output <-- get_flag_train1_getinfor_train3 = output := flag_train1_getinfor_train3 ;
    output <-- get_flag_train1_termination = output := flag_train1_termination ;

    output <-- get_flag_train1_receive_train3_VCre = output := flag_train1_receive_train3_VCre ;
    output <-- get_flag_train1_check_train3_VCre = output := flag_train1_check_train3_VCre ;
    output <-- get_flag_train1_confirm_train3_VCre = output := flag_train1_confirm_train3_VCre ;
    output <-- get_flag_train1_analyze_VC = output := flag_train1_analyze_VC ;
    output <-- get_flag_train1_VC_terminationcmd = output := flag_train1_VC_terminationcmd ;
    output <-- get_flag_train1_analyze_acdc = output := flag_train1_analyze_acdc ;

    output <-- get_flag_train1_wait_VC = output := flag_train1_wait_VC ;

    output <-- get_flag_train1_confirm_train3completeVCinfor = output := flag_train1_confirm_train3completeVCinfor ;
    output <-- get_flag_train1_informRMU = output := flag_train1_informRMU
END
