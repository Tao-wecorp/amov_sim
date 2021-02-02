%% Parse PX4 log file
dir_path = uigetdir;
File = dir(fullfile(dir_path,'*vehicle_attitude_0.csv'));
data = load(fullfile(File.folder, File.name));

timestamp_ms = data(:,1)*1e-3;

q0 = data(:,5);
q1 = data(:,6);
q2 = data(:,7);
q3 = data(:,8);

for i = 1:length(q0)
   euler(i,:) = quaternion2euler([q0(i),q1(i),q2(i),q3(i)]); 
end

p = data(:,2);
q = data(:,3);
r = data(:,4);

states.phi_rad = timeseries(single(euler(:,1)), timestamp_ms*1e-3);
states.theta_rad = timeseries(single(euler(:,2)), timestamp_ms*1e-3);
states.psi_rad = timeseries(single(euler(:,3)), timestamp_ms*1e-3);
states.p_radDs = timeseries(single(p), timestamp_ms*1e-3);
states.q_radDs = timeseries(single(q), timestamp_ms*1e-3);
states.r_radDs = timeseries(single(r), timestamp_ms*1e-3);

File = dir(fullfile(dir_path,'*vehicle_attitude_setpoint_0.csv'));
data = load(fullfile(File.folder, File.name));

timestamp_ms = data(:,1)*1e-3;
phi_ref = data(:,2);
theta_ref = data(:,3);
psi_ref = data(:,4);

reference.phi_ref_rad = timeseries(single(phi_ref), timestamp_ms*1e-3);
reference.theta_ref_rad = timeseries(single(theta_ref), timestamp_ms*1e-3);
reference.psi_ref_rad = timeseries(single(psi_ref), timestamp_ms*1e-3);
reference.p_ref_radDs = timeseries(single(0), timestamp_ms*1e-3);
reference.q_ref_radDs = timeseries(single(0), timestamp_ms*1e-3);
reference.r_ref_radDs = timeseries(single(0), timestamp_ms*1e-3);

command.reset = timeseries(uint8(0), timestamp_ms*1e-3);
command.mode = timeseries(uint8(0), timestamp_ms*1e-3);
command.base_throttle = timeseries(single(0), timestamp_ms*1e-3);

File = dir(fullfile(dir_path,'*actuator_controls_0_0.csv'));
data = load(fullfile(File.folder, File.name));

timestamp_ms = data(:,1)*1e-3;
control_out.u_x = timeseries(single(data(:,3)), timestamp_ms*1e-3);
control_out.u_y = timeseries(single(data(:,4)), timestamp_ms*1e-3);
control_out.u_z = timeseries(single(data(:,5)), timestamp_ms*1e-3);

% set stop time
stop_time = reference.phi_ref_rad.Time(end);