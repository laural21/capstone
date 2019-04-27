-- Uncomment if tables need to be recreated
-- Drop M04 last because of dependencies in M052 and M06
--
-- DROP TABLE M052;
-- DROP TABLE M06;
-- DROP TABLE M04;
-- 
-- To run from command line, connect to database, then "@ + FILEPATH"
-- e.g. @C:\Users\supplier_admin\Desktop\Machines.sql

CREATE TABLE M04 (
K1001 VARCHAR(8),
K1002 VARCHAR(40),
K1004 VARCHAR(30),
K1053 VARCHAR(10),
K1081 VARCHAR(7),
K1082 VARCHAR(40),
K1086 VARCHAR(5),
K1100 VARCHAR(10),
K1103 VARCHAR(12),
K1104 VARCHAR(30),
K1303 VARCHAR(8),
DMC_GearUnit VARCHAR(12),
Machine_1 VARCHAR(5),
Type_1 VARCHAR(8),
Attribute1 VARCHAR(3),
Date_Time VARCHAR(30),
Event VARCHAR(3),
BatchNumber VARCHAR(15),
NestNumber VARCHAR(1),
DMC_SteeringColumn VARCHAR(15),
Machine_2 VARCHAR(5),
Type_2 VARCHAR(8),
Attribute2 VARCHAR(3),
CONSTRAINT batch_num UNIQUE (BatchNumber),
CONSTRAINT dmc_gear UNIQUE (DMC_GearUnit)
);
	
CREATE TABLE M052 (
M052_ID INT NOT NULL,
K1001 SMALLINT,
K1002 VARCHAR2(30),
K1004 VARCHAR2(30),
K1053 VARCHAR2(10),
K1081 VARCHAR2(10),
K1082 VARCHAR2(15),
K1086 VARCHAR2(10),
K1100 VARCHAR2(10),
K1103 VARCHAR2(10),
K1104 VARCHAR2(30),
K1303 VARCHAR2(10),
C052SMposBefJoinTD1Actual SMALLINT,
Attribute1 SMALLINT,
DateTime VARCHAR2(30),
Event1 SMALLINT,
Event2 SMALLINT,
Event3 SMALLINT,
Event4 SMALLINT,
M052BatchNumber VARCHAR2(15),
Nest_number	SMALLINT,
C052SMposBefJoinTD1Diff SMALLINT,
Attribute2 SMALLINT,
C052SMposBefJoinTD2Actual SMALLINT,
Attribute3 SMALLINT,
C052SMposBefJoinTD2Diff SMALLINT,
Attribute4 SMALLINT,
C052SMjoinStatorActual SMALLINT,
Attribute5 SMALLINT,
C052SMjoinStatorDiff SMALLINT,
Attribute6 SMALLINT,
C052SMjoinMagnetActual SMALLINT,
Attribute7 SMALLINT,
C052SMjoinMagnetDiff SMALLINT,
Attribute8 SMALLINT,
C052calibrationMagneticField SMALLINT,
Attribute9 SMALLINT,
P052joinStatorMeasPrePosTD1 DECIMAL(15),
Attribute10 SMALLINT,
P052joinStatorMeasPrePosTD2 DECIMAL(15),
Attribute11 SMALLINT,
Q052joinStatorDeltaMeasPrePos DECIMAL(15),
Attribute12 SMALLINT,
Q052joinStatorMeasPrePosAvg DECIMAL(15),
Attribute13 SMALLINT,
P052joinStatorForceMaxZone0 SMALLINT,
Attribute14 SMALLINT,
P052joinStatorForceMaxZone1 SMALLINT,
Attribute15 SMALLINT,
Q052joinStatorForceMinZone1 SMALLINT,
Attribute16 SMALLINT,
P052joinStatorForceAvgZone1 SMALLINT,
Attribute17 SMALLINT,
Q052joinStatorForceMaxZone2 SMALLINT,
Attribute18 SMALLINT,
Q052joinStatorForceMinZone2 SMALLINT,
Attribute19 SMALLINT,
P052joinStatorForceAvgZone2 SMALLINT,
Attribute20 SMALLINT,
P052joinStatorDeltaForce SMALLINT,
Attribute21 SMALLINT,
P052joinStatorWay SMALLINT,
Attribute22 SMALLINT,
P052joiningstatorGradient SMALLINT,
Attribute23 SMALLINT,
Q052joinStatorJoinPos DECIMAL(15),
Attribute24 SMALLINT,
Q052joinStatorJoinPosTD1 DECIMAL(15),
Attribute25 SMALLINT,
Q052joinStatorJoinPosTD2 DECIMAL(15),
Attribute26 SMALLINT,
Q052joinStatJoinPosAftAdjAvg DECIMAL(15),
Attribute27 SMALLINT,
P052joinMagnetForceMaxZone0 SMALLINT,
Attribute28 SMALLINT,
P052joinMagnetForceMaxZone1 SMALLINT,
Attribute29 SMALLINT,
Q052joinMagnetForceMinZone1 SMALLINT,
Attribute30 SMALLINT,
P052joinMagnetForceAvgZone1 SMALLINT,
Attribute31 SMALLINT,
Q052joinMagnetForceMaxZone2 SMALLINT,
Attribute32 SMALLINT,
Q052joinMagnetForceMinZone2 SMALLINT,
Attribute33 SMALLINT,
P052joinMagnetForceAvgZone2 SMALLINT,
Attribute34 SMALLINT,
Q052joinMagnetJoinPos DECIMAL(15),
Attribute35 SMALLINT,
P052joinMagnetDeltaForce SMALLINT,
Attribute36 SMALLINT,
P_052_joining_magnet_Way SMALLINT,
Attribute37 SMALLINT,
P052joinMagnetGradient SMALLINT,
Attribute38 SMALLINT,
Q052AdjOrientToothSpindle SMALLINT,
Attribute39 SMALLINT,
P_052_Adjustement_angle_MM DECIMAL(15),
Attribute40 SMALLINT,
P052QualMeasMMafterJoinWLoad DECIMAL(15),
Attribute41 SMALLINT,
Q052QualMeasMMaftJoinWOload DECIMAL(15),
Attribute42 SMALLINT,
P052QualityMeasMMbefJoinNest1 DECIMAL(15),
Attribute43 SMALLINT,
P052QualityMeasMMbefJoinNest2 DECIMAL(15),
Attribute44 SMALLINT,
P052QualityMeasMMbefJoinNest3 DECIMAL(15),
Attribute45 SMALLINT,
P052GradientMM DECIMAL(15),
Attribute46 SMALLINT,
PRIMARY KEY (M052_ID),
CONSTRAINT fk_M052batchnumber
FOREIGN KEY (M052BatchNumber) REFERENCES M04 (DMC_GearUnit),
CONSTRAINT b UNIQUE (M052BatchNumber));

CREATE TABLE M06 (
M06_ID INT NOT NULL,
K1001 VARCHAR2(10),
K1002 VARCHAR2(10),
K1004 VARCHAR2(30),
K1053 VARCHAR2(10),
K1081 VARCHAR2(6),
K1082 VARCHAR2(40),
K1086 VARCHAR2(10),
K1100 VARCHAR2(10),
K1103 VARCHAR2(10),
K1104 VARCHAR2(30),
K1303 VARCHAR2(10),
M_06_Temperature_TSU_module DECIMAL(2),
DateTime VARCHAR2(30),
Event1 SMALLINT,
Event2 SMALLINT,
Event3 SMALLINT,
Event4 SMALLINT,
M06BatchNumber VARCHAR2(15),
P_06_Calibration_Cycles SMALLINT,
P_06_EndlockEndposPositive SMALLINT,
P_06_EndlockEndtorquePositive SMALLINT,
P_06_EndlockTorqueLimPosPos SMALLINT,
P_06_EndlockAnglePositive SMALLINT,
P_06_EndlockEndposNeg SMALLINT,
P_06_EndlockEndtorqueNeg SMALLINT,
P_06_EndlockTorqueLimPosNeg SMALLINT,
P_06_EndlockAngleNeg SMALLINT,
Q_Offset_TSU_A DECIMAL(20),
Q_Offset_TSU_B DECIMAL(20),
Q_Gain_TSU_A DECIMAL(20),
Q_Gain_TSU_B DECIMAL(20),
M_CubicFactor_TSU_A DECIMAL(20),
M_CubicFactor_TSU_B DECIMAL(20),
Q_TSU_MaxAccuracyAcenterZone1 DECIMAL(20),
Q_TSU_AccuracyAoffcenterZone0 DECIMAL(20),
Q_TSU_AccuracyAoffcenterZone2 DECIMAL(20),
Q_TSU_Max_Hysterese_A DECIMAL(20),
Q_TSU_MaxAccuracyBcenterZone1 DECIMAL(20),
Q_TSU_AccuracyBoffcenterZone0 DECIMAL(20),
Q_TSU_AccuracyBoffcenterZone2 DECIMAL(20),
Q_TSU_Max_Hysteresis_B DECIMAL(20),
Q_TSU_Max_Difference DECIMAL(20),
Q_TSU_Max_Symmetry_A_Zone0 DECIMAL(20),
Q_TSU_Max_Symmetry_A_Zone1 DECIMAL(20),
Q_TSU_Max_Symmetry_A_Zone2 DECIMAL(20),
Q_TSU_Max_Symmetry_B_Zone0 DECIMAL(20),
Q_TSU_Max_Symmetry_B_Zone1 DECIMAL(20),
Q_TSU_Max_Symmetry_B_Zone2 DECIMAL(20),
Q_TsuVoltage_min DECIMAL(6),
Q_TsuVoltage_max DECIMAL(6),
Q_TsuVoltage_mean DECIMAL(20),
Q_TsuCurrent_min DECIMAL(6),
Q_TsuCurrent_max DECIMAL(6),
Q_TsuCurrent_mean DECIMAL(20),
P_Gain_A_1st_run DECIMAL(20),
P_Gain_B_1st_run DECIMAL(20),
P_Offset_A_1st_run DECIMAL(20),
P_Offset_B_1st_run DECIMAL(20),
Q_Margincheck_done DECIMAL(4),
M_TsuRegister_0x10_1run_A INT,
M_TsuRegister_0x11_1run_A INT,
M_TsuRegister_0x12_1run_A INT,
M_TsuRegister_0x13_1run_A INT,
M_TsuRegister_0x14_1run_A INT,
M_TsuRegister_0x15_1run_A INT,
M_TsuRegister_0x16_1run_A INT,
M_TsuRegister_0x17_1run_A INT,
M_TsuRegister_0x18_1run_A INT,
M_TsuRegister_0x19_1run_A INT,
M_TsuRegister_0x1A_1run_A INT,
M_TsuRegister_0x10_1run_B INT,
M_TsuRegister_0x11_1run_B INT,
M_TsuRegister_0x12_1run_B INT,
M_TsuRegister_0x13_1run_B INT,
M_TsuRegister_0x14_1run_B INT,
M_TsuRegister_0x15_1run_B INT,
M_TsuRegister_0x16_1run_B INT,
M_TsuRegister_0x17_1run_B INT,
M_TsuRegister_0x18_1run_B INT,
M_TsuRegister_0x19_1run_B INT,
M_TsuRegister_0x1A_1run_B INT,
M_TsuRegister_0x10_final_A INT,
M_TsuRegister_0x11_final_A INT,
M_TsuRegister_0x12_final_A INT,
M_TsuRegister_0x13_final_A INT,
M_TsuRegister_0x14_final_A INT,
M_TsuRegister_0x15_final_A INT,
M_TsuRegister_0x16_final_A INT,
M_TsuRegister_0x17_final_A INT,
M_TsuRegister_0x18_final_A INT,
M_TsuRegister_0x19_final_A INT,
M_TsuRegister_0x1A_final_A INT,
M_TsuRegister_0x10_final_B INT,
M_TsuRegister_0x11_final_B INT,
M_TsuRegister_0x12_final_B INT,
M_TsuRegister_0x13_final_B INT,
M_TsuRegister_0x14_final_B INT,
M_TsuRegister_0x15_final_B INT,
M_TsuRegister_0x16_final_B INT,
M_TsuRegister_0x17_final_B INT,
M_TsuRegister_0x18_final_B INT,
M_TsuRegister_0x19_final_B INT,
M_TsuRegister_0x1A_final_B INT,
P_Monitoring_Offset_A DECIMAL(20),
P_Monitoring_Offset_B DECIMAL(20),
PRIMARY KEY (M06_ID),
CONSTRAINT fk_M06batchnumber 
FOREIGN KEY (M06BatchNumber) REFERENCES M04 (BatchNumber),
CONSTRAINT c UNIQUE (M06BatchNumber));

--CREATE SEQUENCE M052IDs
--START WITH 1
--INCREMENT BY 1;

--CREATE SEQUENCE M06IDs
--START WITH 1
--INCREMENT BY 1;