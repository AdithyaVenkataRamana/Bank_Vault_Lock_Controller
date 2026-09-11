
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Bank_Vault_Lock_Controller -dir "C:/Users/sgpma/Downloads/Projects/Bank_Vault_Lock_Controller/planAhead_run_1" -part xc6slx9tqg144-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/sgpma/Downloads/Projects/Bank_Vault_Lock_Controller/bank_vault_lock_controller.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/sgpma/Downloads/Projects/Bank_Vault_Lock_Controller} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "bank_vault_lock_controller.ucf" [current_fileset -constrset]
add_files [list {bank_vault_lock_controller.ucf}] -fileset [get_property constrset [current_run]]
link_design
