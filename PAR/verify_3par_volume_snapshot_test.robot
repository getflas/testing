*** Settings ***
Library           HP3PAR.py    WITH NAME    HP3PAR
Library           Collections
Variables         inputs.yaml

*** Variables ***
@{packages}       Collections
&{3par_array}     name=3par

*** Test Cases ***
verify_3par_volume_snapshot_test
    HP3PAR.Connect    ${APIServer}
    Log    Started CPG Creation
    Comment    ${cpg_output}    HP3PAR.Create Cpg    auth_3par_user=${HP3PAR.user}    auth_3par_password=${HP3PAR.password}    ip_address_3par=${HP3PAR.ip}    cpg_name=${CPG.name}
    ...    size_GiB=${CPG.size_GiB}
    Comment    ${status}    Get From Dictionary    ${cpg_output}    status_code
    Comment    Run Keyword If    ${status} == 400    FAIL    CPG Creation Failed !!!
    ...    ELSE    Log    CPG Creation is succesfully!!!
    Log    CPG Creation is succesfully!!!
    Log    Adding Host details to HP3PAR
    Log    FC Host details added succesfully to 3PAR!!!
    Comment    ${host_out}    HP3PAR.Create Fc Host    auth_3par_user=${HP3PAR.user}    auth_3par_password=${HP3PAR.password}    ip_address_3par=${HP3PAR.ip}    host_FC=${Host.name}
    ...    host_persona=${Host.persona}    fc_wwns=${Host.fc_wwns}
    Comment    ${host_c_status}    Get From Dictionary    ${host_out}    status_code
    Comment    Run Keyword If    ${host_c_status} == 200    Log    FC Host details added succesfully to 3PAR!!!
    ...    ELSE    FAIL    Adding FC Host Details Failed !!!
    Log    Started Creating new Volume
    ${vol_c_out}    HP3PAR.Create Volume    auth_3par_user=${HP3PAR.user}    auth_3par_password=${HP3PAR.password}    ip_address_3par=${HP3PAR.ip}    cpg_name=${CPG.name}    vol_name=${Volume.name}
    ...    vol_size=${Volume.size}
    ${vol_c_status}    Get From Dictionary    ${vol_c_out}    status_code
    Run Keyword If    ${vol_c_status} == 200    Log    3PAR Volume created succesfully !!!
    ...    ELSE    FAIL    3PAR Volume Creation Failed !!!
    Log    Exporting the Volume created to Host Added above
    ${exp_out}    HP3PAR.Export Volume To Host    auth_3par_user=${HP3PAR.user}    auth_3par_password=${HP3PAR.password}    ip_address_3par=${HP3PAR.ip}    host_name=${Host.name}    vol_name=${Volume.name}
    ...    lun_id=${Volume.lun_id}
    ${exp_status}    Get From Dictionary    ${exp_out}    status_code
    Run Keyword If    ${exp_status} == 200    Log    3PAR Volume exported succesfully \ to the host!!!
    ...    ELSE    FAIL    3PAR Volume export to host - \ Failed !!!
    ${add_snap_out}    HP3PAR.Add Snap Cpg To Volume    auth_3par_user=${HP3PAR.user}    auth_3par_password=${HP3PAR.password}    ip_address_3par=${HP3PAR.ip}    vol_name=${Volume.name}    new_snap_cpg=${CPG.name}
    ${add_snap_status}    Get From Dictionary    ${add_snap_out}    status_code
    Run Keyword If    ${add_snap_status} == 200    Log    Snap CPG details added to the volume succesfully
    ...    ELSE    FAIL    Snap CPG details updation failed !!!
    Log    Started Snapshot Creation
    ${snap_out}    HP3PAR.Create Snapshot    auth_3par_user=${HP3PAR.user}    auth_3par_password=${HP3PAR.password}    ip_address_3par=${HP3PAR.ip}    vol_name=${Volume.name}    snap_name=${Snapshot.name}
    ...    read_only=${Snapshot.read_only}    snap_comment=${Snapshot.comment}
    ${snap_status}    Get From Dictionary    ${snap_out}    status_code
    Run Keyword If    ${snap_status} == 200    Log    Snapshot to Volume created succesfully
    ...    ELSE    FAIL    Sanpshot creation Failed !!!
    Log    Started Deleting all the configurations done as part of this test case
    ${unexp_out}    HP3PAR.Unexport Volume    auth_3par_user=${HP3PAR.user}    auth_3par_password=${HP3PAR.password}    ip_address_3par=${HP3PAR.ip}    host_name=${Host.name}    vol_name=${Volume.name}
    ...    lun_id=${Volume.lun_id}
    Run Keyword If    ${unexp_out} == 200    Log    Volume unexported succesfully from host
    ...    ELSE    FAIL    Volume unexport Failed !!!
    ${del_snap_out}    HP3PAR.Delete Volume    auth_3par_user=${HP3PAR.user}    auth_3par_password=${HP3PAR.password}    ip_address_3par=${HP3PAR.ip}    vol_name=${Snapshot.name}
    Run Keyword If    ${del_snap_out} == 200    Log    Snapshot deleted succesfully from 3PAR
    ...    ELSE    FAIL    Snapshot deletion Failed !!!
    ${del_vol_out}    HP3PAR.Delete Volume    auth_3par_user=${HP3PAR.user}    auth_3par_password=${HP3PAR.password}    ip_address_3par=${HP3PAR.ip}    vol_name=${Volume.name}
    Run Keyword If    ${del_vol_out} == 200    Log    Volume deleted succesfully from 3PAR
    ...    ELSE    FAIL    Volume deletion Failed !!!
    Comment    ${d_output}    HP3PAR.Delete Cpg    auth_3par_user=${HP3PAR.user}    auth_3par_password=${HP3PAR.password}    ip_address_3par=${HP3PAR.ip}    cpg_name=${CPG.name}
    ...    size_GiB=${CPG.size_GiB}
    Comment    Run Keyword If    ${d_output} == 400    FAIL    CPG Deletion Failed !!!
    ...    ELSE    Log    CPG Deleted succesfully!!!
    Comment    ${host_d_out}    HP3PAR.Delete Host    auth_3par_user=${HP3PAR.user}    auth_3par_password=${HP3PAR.password}    ip_address_3par=${HP3PAR.ip}    host_name=${Host.name}
    Comment    Run Keyword If    ${host_d_out} == 200    Log    Host detailed deleted successfully from 3PAR
    ...    ELSE    FAIL    Host deletion failed from 3PAR

*** Keywords ***
