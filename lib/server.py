import socket
import threading
import screen_brightness_control
import pyautogui
from ctypes import cast, POINTER
from comtypes import CLSCTX_ALL
from pycaw.pycaw import AudioUtilities, IAudioEndpointVolume
devices = AudioUtilities.GetSpeakers()
interface = devices.Activate(
    IAudioEndpointVolume._iid_, CLSCTX_ALL, None)
volume = cast(interface, POINTER(IAudioEndpointVolume))
from time import sleep

volume_convert_dict = {0: -65.25, 1: -56.99, 2: -51.67, 3: -47.74, 4: -44.62, 5: -42.03, 6: -39.82, 7: -37.89, 8: -36.17, 9: -34.63, 10: -33.24,
 11: -31.96, 12: -30.78, 13: -29.68, 14: -28.66, 15: -27.7, 16: -26.8, 17: -25.95, 18: -25.15, 19: -24.38, 20: -23.65,
 21: -22.96, 22: -22.3, 23: -21.66, 24: -21.05, 25: -20.46, 26: -19.9, 27: -19.35, 28: -18.82, 29: -18.32, 30: -17.82,
 31: -17.35, 32: -16.88, 33: -16.44, 34: -16.0, 35: -15.58, 36: -15.16, 37: -14.76, 38: -14.37, 39: -13.99, 40: -13.62,
 41: -13.26, 42: -12.9, 43: -12.56, 44: -12.22, 45: -11.89, 46: -11.56, 47: -11.24, 48: -10.93, 49: -10.63, 50: -10.33,
 51: -10.04, 52: -9.75, 53: -9.47, 54: -9.19, 55: -8.92, 56: -8.65, 57: -8.39, 58: -8.13, 59: -7.88, 60: -7.63,
 61: -7.38, 62: -7.14, 63: -6.9, 64: -6.67, 65: -6.44, 66: -6.21, 67: -5.99, 68: -5.76, 69: -5.55, 70: -5.33,
 71: -5.12, 72: -4.91, 73: -4.71, 74: -4.5, 75: -4.3, 76: -4.11, 77: -3.91, 78: -3.72, 79: -3.53, 80: -3.34,
 81: -3.15, 82: -2.97, 83: -2.79, 84: -2.61, 85: -2.43, 86: -2.26, 87: -2.09, 88: -1.91, 89: -1.75, 90: -1.58,
 91: -1.41, 92: -1.25, 93: -1.09, 94: -0.93, 95: -0.77, 96: -0.61, 97: -0.46, 98: -0.3, 99: -0.15, 100: 0.0}



def accept_connection(sock):

    conn, addr = sock.accept()

    print("Accepted connection from ", addr)
    while True:
        try:
            command = conn.recv(20).decode('utf-8')
            #print(command)

            if command:
                command_lst = command.split(":")

                if command_lst[0] == "s":
                    if (command_lst[-1] == ""):
                        temp = command_lst[len(command_lst) - 2]
                        temp = temp.replace("s", "")
                        volume_level = int(float(temp))
                    else:
                        volume_level = int(float(command_lst[-1].replace("s", "")))

                    print(volume_level)
                    volume.SetMasterVolumeLevel(volume_convert_dict[int(volume_level)], None)

                elif command_lst[0] == "b":

                    if(command_lst[-1] == ""):
                        temp = command_lst[len(command_lst)-2]
                        temp = temp.replace("b","")
                        brightness_level = int(float(temp))
                    else:
                        brightness_level = int(float(command_lst[-1].replace("b", "")))

                    print(brightness_level)
                    screen_brightness_control.set_brightness(brightness_level)

                elif command_lst[0] == "mute":
                    if (volume.GetMute() == 1):
                        volume.SetMute(0, None)
                    else:
                        volume.SetMute(1, None)

                elif command_lst[0] == "p":
                    if(command_lst[1] == "next"):
                        pyautogui.press("nexttrack")
                    elif(command_lst[1] == "prev"):
                        pyautogui.press("prevtrack")
                    elif(command_lst[1] == "pp"):
                        pyautogui.press("playpause")

                elif command_lst[0] == "m":
                    # n, m = pyautogui.size()
                    # x, y = pyautogui.position()
                    if(command_lst[1] == "click"):
                        pyautogui.click()
                    elif(command_lst[1] == "r"):
                        pyautogui.move(50,0)
                    elif(command_lst[1] == "l"):
                        pyautogui.move(-50,0)
                    elif(command_lst[1] == "u"):
                        pyautogui.move(0,-50)
                    elif(command_lst[1] == "d"):
                        pyautogui.move(0,50)

                elif command_lst[0] == "k":
                    pyautogui.write(command_lst[1])

                elif command_lst[0] == "ppt":
                    pyautogui.press(command_lst[1])
    #         if (command == "close"):
    #             break
    #
        except ConnectionResetError:
            break

    # conn.close()
    print("connection closed")

def main():
    while True:
        sock = socket.socket()
        print("Socket successfully created")

        port = 6969
        sock.bind(('192.168.0.6', port))
        sock.listen(5)
        print("Listening for connections")
        accept_connection(sock)


if __name__ == "__main__":
    main()