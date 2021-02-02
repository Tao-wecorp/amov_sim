function cellInfo = bus_definition(varargin) 
% BUS_DEFINITION returns a cell array containing bus object information 
% 
% Optional Input: 'false' will suppress a call to Simulink.Bus.cellToObject 
%                 when the MATLAB file is executed. 
% The order of bus element attributes is as follows:
%   ElementName, Dimensions, DataType, SampleTime, Complexity, SamplingMode, DimensionsMode, Min, Max, DocUnits, Description 

suppressObject = false; 
if nargin == 1 && islogical(varargin{1}) && varargin{1} == false 
    suppressObject = true; 
elseif nargin > 1 
    error('Invalid input argument(s) encountered'); 
end 

cellInfo = { ... 
  { ... 
    'Command', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', {... 
{'reset', 1, 'uint8', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'mode', 1, 'uint8', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'base_throttle', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
    } ...
  } ...
  { ... 
    'Control_Output', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', {... 
{'u_x', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'u_y', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'u_z', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
    } ...
  } ...
  { ... 
    'Plant_States', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', {... 
{'dot_omega_B_radDs2', 3, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'omega_B_radDs', 3, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'quat', 4, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'euler', 3, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'accel_O_mDs2', 3, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'vel_O_mDs', 3, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'pos_O_m', 3, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
    } ...
  } ...
  { ... 
    'Reference', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', {... 
{'phi_ref_rad', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'theta_ref_rad', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'psi_ref_rad', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'p_ref_radDs', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'q_ref_radDs', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'r_ref_radDs', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
    } ...
  } ...
  { ... 
    'States', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', {... 
{'phi_rad', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'theta_rad', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'psi_rad', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'p_radDs', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'q_radDs', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'r_radDs', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
    } ...
  } ...
}'; 

if ~suppressObject 
    % Create bus objects in the MATLAB base workspace 
    Simulink.Bus.cellToObject(cellInfo) 
end 