'''
Sample Usage:-
python pose_estimation.py --K_Matrix calibration_matrix.npy --D_Coeff distortion_coefficients.npy --type DICT_5X5_100
'''



import sys
import os

sys.path.append(os.path.join(os.path.dirname(__file__), ".."))
from profiler import Profiler


import numpy as np
import cv2
import sys
import argparse
import time


ap = argparse.ArgumentParser()
ap.add_argument("-k", "--K_Matrix", required=True, help="Path to calibration matrix (numpy file)")
ap.add_argument("-d", "--D_Coeff", required=True, help="Path to distortion coefficients (numpy file)")
ap.add_argument("-t", "--type", type=str, default="DICT_ARUCO_ORIGINAL", help="Type of ArUCo tag to detect")
ap.add_argument('-i', '--image', required=True, help = 'path to input image')
args = vars(ap.parse_args())




ARUCO_DICT = {
	"DICT_4X4_50": cv2.aruco.DICT_4X4_50,
	"DICT_4X4_100": cv2.aruco.DICT_4X4_100,
	"DICT_4X4_250": cv2.aruco.DICT_4X4_250,
	"DICT_4X4_1000": cv2.aruco.DICT_4X4_1000,
	"DICT_5X5_50": cv2.aruco.DICT_5X5_50,
	"DICT_5X5_100": cv2.aruco.DICT_5X5_100,
	"DICT_5X5_250": cv2.aruco.DICT_5X5_250,
	"DICT_5X5_1000": cv2.aruco.DICT_5X5_1000,
	"DICT_6X6_50": cv2.aruco.DICT_6X6_50,
	"DICT_6X6_100": cv2.aruco.DICT_6X6_100,
	"DICT_6X6_250": cv2.aruco.DICT_6X6_250,
	"DICT_6X6_1000": cv2.aruco.DICT_6X6_1000,
	"DICT_7X7_50": cv2.aruco.DICT_7X7_50,
	"DICT_7X7_100": cv2.aruco.DICT_7X7_100,
	"DICT_7X7_250": cv2.aruco.DICT_7X7_250,
	"DICT_7X7_1000": cv2.aruco.DICT_7X7_1000,
	"DICT_ARUCO_ORIGINAL": cv2.aruco.DICT_ARUCO_ORIGINAL,
	"DICT_APRILTAG_16h5": cv2.aruco.DICT_APRILTAG_16h5,
	"DICT_APRILTAG_25h9": cv2.aruco.DICT_APRILTAG_25h9,
	"DICT_APRILTAG_36h10": cv2.aruco.DICT_APRILTAG_36h10,
	"DICT_APRILTAG_36h11": cv2.aruco.DICT_APRILTAG_36h11
}

if ARUCO_DICT.get(args["type"], None) is None:
    print(f"ArUCo tag type '{args['type']}' is not supported")
    sys.exit(0)

aruco_dict_type = ARUCO_DICT[args["type"]]
calibration_matrix_path = args["K_Matrix"]
distortion_coefficients_path = args["D_Coeff"]

k = np.load(calibration_matrix_path)
d = np.load(distortion_coefficients_path)

frame = cv2.imread(args["image"])

parameters = cv2.aruco.DetectorParameters_create()
cv2.aruco_dict = cv2.aruco.Dictionary_get(aruco_dict_type)

def pose_estimation(frame, matrix_coefficients, distortion_coefficients):

    '''
    frame - Frame from the video stream
    matrix_coefficients - Intrinsic matrix of the calibrated camera
    distortion_coefficients - Distortion coefficients associated with your camera

    return:-
    frame - The frame with the axis drawn on it
    '''

    # frame_cpy = frame.copy()
    corners, ids, rejected_img_points = cv2.aruco.detectMarkers(frame, cv2.aruco_dict)
    print("Detected corners: {}".format(corners))
    # if ids is not None and len(ids) > 0:
    #     cv2.aruco.drawDetectedMarkers(frame_cpy, corners, ids)
    #     # Estimate pose of each marker and return the values rvec and tvec---(different from those of camera coefficients)
    #     rvec, tvec, markerPoints = cv2.aruco.estimatePoseSingleMarkers(corners, 0.05, matrix_coefficients,
    #                                                                    distortion_coefficients)
    #     # If markers are detected
    #     for i in range(0, len(ids)):
    #         cv2.drawFrameAxes(frame_cpy, matrix_coefficients, distortion_coefficients, rvec[i], tvec[i], 0.1)  

    # return frame_cpy


def run():
    pose_estimation(frame, k, d)


def main(): 
    p = Profiler(100)
    p.run(Profiler.Item("aruco_pose_estimation", run))

if __name__ == '__main__':
    main()
    
    

