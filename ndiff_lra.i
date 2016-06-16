[Mesh]
 type = GeneratedBIDMesh
 dim = 2
 xmin = 0
 xmax = 165
 ymin = 0
 ymax = 165
# elem_type = QUAD4
 elem_type = QUAD9
 nx = 11
 ny = 11
 subdomain='2 1 1 1 1 2 2 3 3 5 5
            1 1 1 1 1 1 1 3 3 5 5
            1 1 1 1 1 1 1 3 3 5 5
            1 1 1 1 1 1 1 3 3 5 5
            1 1 1 1 1 1 1 3 3 5 5
            2 1 1 1 1 2 2 6 6 5 5
            2 1 1 1 1 2 2 6 6 5 5
            3 3 3 3 3 3 3 4 5 5 5
            3 3 3 3 3 3 3 5 5 5 5
            5 5 5 5 5 5 5 5 5 5 5
            5 5 5 5 5 5 5 5 5 5 5'

 uniform_refine = 1
[]

[TransportSystems]
 particle = neutron
 equation_type = transient

# number of energy groups
 G = 2

# BC and external sources
 DirichletBoundary = 'top right'
 ReflectingBoundary = 'bottom left'

# assemble_fission_jacobian = true
# assemble_scattering_jacobian = true
# assemble_delay_jacobian = true

 [./diff]
  scheme = CFEM-Diffusion
  n_delay_groups = 2
  family = LAGRANGE
  order = FIRST
  fission_source_as_material = false
#  forceflux = true
#  p0aux2mat = true
 [../]
[]

[Materials]
  [./fuel1_blade_in]
    type           = BuckledFunctionTemperatureMaterial
    block          = 1

    diffusion_coef = '1.255 0.211'
#    NA             = 0
    sigma_s        = '0.232022 0.0
                      0.02533  1.479479'
    fissile        = true
    nu_sigma_f     = '0.004602 0.1091'
    kappa_sigma_f  = '6.06782222e-14 1.438503704e-12'
    chi            = '1.0 0.0'
    sigma_r        = '0.033582 0.1003'

    bz_sqrd        = 0.0001

    neutron_speed  = '3.e7 3.e5'
    delay_fraction = '0.0054 0.001087'
    decay_constant = '0.0654 1.35'
    delay_spectrum = '1.0 0.0
                      1.0 0.0'

#    alpha          = 1.1953808   # = alpha / epsilon = 3.83e-11/3.204e-11
    gamma          = '2.034e-3 0.0'
    temperature    = T
    temp0          = 300

    plus           = true
    dumpMatAt      = 3000000000
  [../]

  [./fuel1_blade_out]
    type           = BuckledFunctionTemperatureMaterial
    block          = 2

    diffusion_coef = '1.268 0.1902'
#    NA             = 0
    sigma_s        = '0.22803 0.0
                      0.02767 1.682071'
    fissile        = true
    nu_sigma_f     = '0.004609 0.08675'
    kappa_sigma_f  = '6.07705185e-14 1.14381481e-12'
    chi            = '1.0 0.0'
    sigma_r        = '0.034851 0.07047'

    bz_sqrd        = 0.0001

    neutron_speed  = '3.e7 3.e5'
    delay_fraction = '0.0054 0.001087'
    decay_constant = '0.0654 1.35'
    delay_spectrum = '1.0 0.0
                      1.0 0.0'

#    alpha          = 1.1953808
    gamma          = '2.034e-3 0.0'
    temperature    = T
    temp0          = 300

    plus           = true
    dumpMatAt      = 3000000000
  [../]

  [./fuel2_blade_in]
    type           = BuckledFunctionTemperatureMaterial
    block          = 3

    diffusion_coef = '1.259 0.2091'
#    NA             = 0
    sigma_s        = '0.2305884 0.0
                      0.02617   1.5106936'
    fissile        = true
    nu_sigma_f     = '0.004663 0.1021'
    kappa_sigma_f  = '6.14825185e-14 1.346207407e-12'
    chi            = '1.0 0.0'
    sigma_r        = '0.034172 0.08344'

    bz_sqrd        = 0.0001

    neutron_speed  = '3.e7 3.e5'
    delay_fraction = '0.0054 0.001087'
    decay_constant = '0.0654 1.35'
    delay_spectrum = '1.0 0.0
                      1.0 0.0'

#    alpha          = 1.1953808
    gamma          = '2.034e-3 0.0'
    temperature    = T
    temp0          = 300

    plus           = true
    dumpMatAt      = 3000000000
  [../]

  [./fuel2_blade_out]
    type           = BuckledFunctionTemperatureMaterial
    block          = 4

    diffusion_coef = '1.259 0.2091'
#    NA             = 0
    sigma_s        = '0.2305884 0.0
                      0.02617   1.5208106'
    fissile        = true
    nu_sigma_f     = '0.004663 0.1021'
    kappa_sigma_f  = '6.14825185e-14 1.346207407e-12'
    chi            = '1.0 0.0'
    sigma_r        = '0.034172 0.073324'

    bz_sqrd        = 0.0001

    neutron_speed  = '3.e7 3.e5'
    delay_fraction = '0.0054 0.001087'
    decay_constant = '0.0654 1.35'
    delay_spectrum = '1.0 0.0
                      1.0 0.0'

#    alpha          = 1.1953808
    gamma          = '2.034e-3 0.0'
    temperature    = T
    temp0          = 300

    plus           = true
    dumpMatAt      = 3000000000
  [../]

  [./reflector]
    type           = BuckledConstantNeutronicsMaterial
    block          = 5

    diffusion_coef = '1.257 0.1592'
#    NA             = 0
    sigma_s        = '0.2171793 0.0
                      0.04754   2.074692'
    fissile        = false
    sigma_r        = '0.0481434 0.01911'

    bz_sqrd        = 0.0001

    neutron_speed  = '3.e7 3.e5'
    dumpMatAt      = 30000000
  [../]

  [./fuel2_blade_in_r]
    type           = BuckledFunctionTemperatureMaterial
    block          = 6

    diffusion_coef = '1.259 0.2091'
#    NA             = 0
    sigma_s        = '0.2305884 0.0
                      0.02617   1.5106936'
    fissile        = true
    nu_sigma_f     = '0.004663 0.1021'
    kappa_sigma_f  = '6.14825185e-14 1.346207407e-12'
    chi            = '1.0 0.0'
    sigma_r        = '0.034172 move_blade'

    bz_sqrd        = 0.0001

    neutron_speed  = '3.e7 3.e5'
    delay_fraction = '0.0054 0.001087'
    decay_constant = '0.0654 1.35'
    delay_spectrum = '1.0 0.0
                      1.0 0.0'

#    alpha          = 1.1953808
    gamma           = '2.034e-3 0.0'
    temperature    = T
    temp0          = 300

    plus           = true
    dumpMatAt      = 300000000
  [../]
[]

[AuxVariables]
  [./T]
    order = CONSTANT
    family = MONOMIAL
    [./InitialCondition]
      type = ConstantIC
      value = 300.0
    [../]
  [../]
  [./power]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[AuxKernels]
#  active = 'power'
  [./temperature]
    type = VariableTimeIntegrationAux
    variable = T
    variable_to_integrate = power
    # originally should be alpha/epsilon = 1.1953808
    # due to the normalization, we need to have the coefficient vol*nu/epsilon = 1.331039e9
    # so the final coefficient is alpha*vol*nu/epsilon/epsilon
    #coefficient = 1.591098860816678e+009 # original if power isn't scaled
    #coefficient = 3.182197721633356e+009
    coefficient = 1.195380774032459 # alpha/epsilon if power is scaled
    block = '1 2 3 4 6'
    execute_on = linear
#    use_as_density = false
  [../]
  [./power]
    type = FissionSource
    variable = power
    scalar_flux = 'sflux_g0 sflux_g1'
    nusigf = kappa_sigma_fission
    scale_factor = 1.331039331413620e9 # scaling power such that P0=1e-6
    block ='1 2 3 4 6'
    execute_on = timestep_end
  [../]
[]

[Functions]
 [./move_blade]
   type = SlopeFunction
   timep = '0.0 2.0 3.0'
#   value = '0.08344 0.08344 0.08344'
   value = '0.08344 0.073323993064 0.073323993064'
 [../]
[]

[Executioner]
  type = Transient

#  petsc_options = '-snes_mf_operator'
#  petsc_options = '-snes -snes_linesearch_monitor -snes_test_display'
#  petsc_options = '-snes_mf_operator -ksp_monitor -ksp_monitor_true_residual'
#  petsc_options_iname = '-pc_type -pc_hypre_type -ksp_gmres_restart'
#  petsc_options_value = 'hypre boomeramg 100'
#  petsc_options_iname = '-pc_type -ts_type -snes_type -mat_fd_coloring_err -mat_fd_type'
#  petsc_options_value = 'lu tr test 1e-6 ds'
#  petsc_options_iname = '-pc_type -ts_type'
#  petsc_options_value = 'lu tr'

  start_time = 0.0
  end_time = 3
  dt = 1.e-2

  l_tol = 1e-6
  nl_max_its = 200
  nl_rel_tol = 1e-6
  nl_abs_tol = 1e-8

#  [./TimeStepper]
#    type = SolutionTimeAdaptiveDT
#    dt = 0.01
#  [../]

  dtmax = 0.1
[]

[Outputs]
  file_base = lra_trans
  exodus = false
  csv = true
[]

[MultiApps]
 [./initial_solve]
   type = FullSolveMultiApp
   app_type = YakApp
   execute_on = initial
   positions = '0 0 0'
   input_files = lra_initial.i
 [../]
[]

[Transfers]
 [./copy_solution]
   type = MultiAppSystemCopyTransfer
   direction = from_multiapp
   multi_app = initial_solve
   execute_on = initial
   scale_with_keff = false
 [../]
[]

[Postprocessors]
  [./avg_temp]
    type = ElementAverageValue
    execute_on = 'initial timestep_end'
    variable = T
    block = '1 2 3 4 6'
  [../]
  [./avg_power]
    type = ElementAverageValue
    execute_on = 'initial timestep_end'
    variable = power
    block = '1 2 3 4 6'
  [../]
[]

[Preconditioning]
 active = 'SMP_jfnk'
 [./SMP_jfnk]
   type = SMP

  #Preconditioned JFNK (default)
  solve_type = 'PJFNK'

  petsc_options_iname = '-pc_type -pc_hypre_type -ksp_gmres_restart'
  petsc_options_value = 'hypre boomeramg 100'
#   petsc_options_iname = '-pc_type'
#   petsc_options_value = 'lu'
   full = true
  [../]
[]
