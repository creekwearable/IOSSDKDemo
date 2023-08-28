//
//  CommandReplyViewController.swift
//  CreekSDKDemo
//
//  Created by bean on 2023/7/12.
//

import UIKit
import CreekSDK

class CommandReplyViewController: CreekBaseViewController {
    
    lazy var seedBtn:UIButton = {
        let btn = UIButton.init()
        btn.backgroundColor = .red
        btn.setTitle("Command", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.isUserInteractionEnabled = true
        btn.layer.cornerRadius = FBScale(20)
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(commandClick), for: .touchUpInside)
        btn.isSelected = false
        return btn
    }()
    lazy var textView:UITextView = {
        let text = UITextView.init(frame: CGRect.zero)
        text.text = ""
        text.textColor = .white
        text.backgroundColor = .gray
        text.isUserInteractionEnabled = false
        return text
    }()
    
    var titleStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layOutUI()
    }
    
    func layOutUI(){
        view.addSubview(seedBtn)
        view.addSubview(textView)
        seedBtn.snp.makeConstraints {
            $0.top.equalTo(SAFEAREAINSETS.top + 44)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(FBScale(300))
            $0.height.equalTo(FBScale(100))
        }
        textView.snp.makeConstraints {
            $0.top.equalTo(seedBtn.snp.bottom).offset(FBScale(20))
            $0.left.equalTo(FBScale(20))
            $0.right.equalTo(-FBScale(20))
            $0.height.greaterThanOrEqualTo(0)
            $0.bottom.equalTo(view.snp.bottom).offset(-FBScale(100))
        }
    }
    
    @objc func commandClick(){
        self.view.showRemark(msg: "loding....")
        switch titleStr{
        case "Get Device Information":
            CreekInterFace.instance.getFirmware { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            
            break
        case "Get Device Bluetooth Status":
            
            CreekInterFace.instance.bluetoothStatus { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
        
       
            break
        case "Sync Time":
            CreekInterFace.instance.syncTime {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Get Time":
            
            CreekInterFace.instance.getTime { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
       
            break
        case "Get User Information":
            CreekInterFace.instance.getUserInfo { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
                
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Set User Information":
            CreekInterFace.instance.getUserInfo { model in
                var data = model
                data.personalInfo.year = 2024
                data.personalInfo.month = 11
                data.goalSetting.workoutDay = 7
                data.goalSetting.steps = 100
                data.perferences.distUnit = 1
                data.goalSetting.notifyFlag = .close
                CreekInterFace.instance.setUserInfo(model: data) {
                    self.view.hideRemark()
                    self.textView.text = "success"
                } failure: { code, message in
                    self.view.hideRemark()
                    self.textView.text = message
                }

            } failure: { code, message in
               
            }
            break
        case "Get Alarm Clock":
            CreekInterFace.instance.getAlarm{ model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
                
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Set Alarm Clock":
            CreekInterFace.instance.getAlarm { model in
                var data = protocol_alarm_operate()
                data.alarmItem = model.alarmItem
                var item = protocol_set_alarm_item()
                item.alarmID = 1;
                item.dispStatus = .dispOn
                item.type = .getUp
                item.hour = 22
                item.minute = 30
                item.repeat = [true,true,true,true,true,false,false]
                item.switchFlag = false
                item.laterRemindRepeatTimes = 1
                item.vibrateOnOff = true
                item.name = "abc".data(using: .utf8)!
                data.alarmItem.append(item)
                CreekInterFace.instance.setAlarm(model:data){
                    self.view.hideRemark()
                    self.textView.text = "success"
                } failure: { code, message in
                    self.view.hideRemark()
                    self.textView.text = message
                }

            } failure: { code, message in
               
            }
            break
        case "Get Do Not Disturb":
            CreekInterFace.instance.getDisturb{ model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
            
        case "Set Do Not Disturb":
             var model = protocol_disturb_operate()
            model.disturbOnOff = true
            CreekInterFace.instance.setDisturb(model: model) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Get Screen Brightness":
            CreekInterFace.instance.getScreen{ model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
            
        case "Set Screen Brightness":
            var model =  protocol_screen_brightness_operate()
            model.nightAutoAdjust.startHour = 20
            CreekInterFace.instance.setScreen(model: model) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
            
        case "Get Health Monitoring":
            var data =  protocol_health_monitor_operate()
            data.healthType = health_type.heartRate
            CreekInterFace.instance.getMonitor(operate: data) { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Health monitoring setting":
            
            var data =  protocol_health_monitor_operate()
            data.healthType = health_type.heartRate
            data.measurementInterval = 5
            CreekInterFace.instance.setMonitor(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
            
        case "Sleep monitoring setting":
            var data =  protocol_sleep_monitor_operate()
            data.switchFlag = true
            CreekInterFace.instance.setSleepMonitor(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Sleep monitoring acquisition":
            CreekInterFace.instance.getSleepMonitor { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }

            break
            
        case "World clock setting":
            var data =  protocol_world_time_operate()
             var item = protocol_world_time_item()
            item.cityName =  "shenzheng".data(using: .utf8)!
            item.offestMin = 120
            data.worldTimeItem.append(item)
            CreekInterFace.instance.setWorldTime(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "World clock acquisition":
            CreekInterFace.instance.getWorldTime { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }

            break
     
            
        case "Message switch query":
            CreekInterFace.instance.getMessageOnOff { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }

            break
        case "Message switch setting":
            var data =  protocol_message_notify_switch()
            data.notifySwitch = true
            CreekInterFace.instance.setMessageOnOff(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Set weather":
            var data =  protocol_weather_operate()
            data.switchFlag = true
            var item = protocol_weather_detail_data_item()
            item.hour = 14
            item.curTemp = 30
            item.curMaxTemp = 33
            item.curMinTemp = 26
            data.detailDataItem.append(item)
            CreekInterFace.instance.setWeather(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
            
        case "Incoming call configuration query":
            CreekInterFace.instance.getCall { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }

            break
        case "Incoming call configuration settings":
            var data =  protocol_call_switch()
            data.callSwitch = true
            data.callDelay = 5
            CreekInterFace.instance.setCall(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
            
        case "Contacts query":
            CreekInterFace.instance.getContacts { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }

            break
        case "Contacts settings":
            var data =  protocol_frequent_contacts_operate()
            var item =  protocol_frequent_contacts_item()
            item.phoneNumber = "12345678912".data(using: .utf8)!
            item.contactName = "bean".data(using: .utf8)!
            data.contactsItem.append(item)
            CreekInterFace.instance.setContacts(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        
            
        case "Exercise self-identification query":
            CreekInterFace.instance.getSportIdentification { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }

            break
        case "Exercise self-identification settings":
            var data =  protocol_exercise_intelligent_recognition()
            data.walkTypeSwitch = true
            CreekInterFace.instance.setSportIdentification(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
            
        case "Exercise sub-item data query":
            CreekInterFace.instance.getSportSub { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Exercise sub-item data setting":
            var data =  protocol_exercise_sporting_param_sort()
            data.sportType = UInt32(sport_type.barbell.rawValue)
            CreekInterFace.instance.setSportSub(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
            
        case "Inquiry about the arrangement order of device exercise":
            CreekInterFace.instance.getSportSort { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }

            break
        case "Setting the arrangement order of device exercise":
            var data =  protocol_exercise_sport_mode_sort()
            data.sportItems.append(sport_type.badminton)
            CreekInterFace.instance.setSportSort(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
            
        case "Get the type of exercise supported by the device":
            CreekInterFace.instance.getSportType { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }

            break
            
        case "Setting the heart rate interval":
            var data =  protocol_exercise_heart_rate_zone()
            data.zone1 = 100
            data.zone2 = 100
            data.zone3 = 100
            data.zone4 = 100
            data.zone5 = 100
            CreekInterFace.instance.setSportHeartRate(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
            
        case "Delete the dial":
            var data =  protocol_watch_dial_plate_operate()
            data.dialName = ["1".data(using: .utf8)!]
            CreekInterFace.instance.delWatchDial(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Set the dial":
            var data =  protocol_watch_dial_plate_operate()
            data.dialName = ["1".data(using: .utf8)!]
            CreekInterFace.instance.setWatchDial(model: data) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Query the dial":
            CreekInterFace.instance.getWatchDial { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Set Language":
            CreekInterFace.instance.setLanguage(type: .japanese) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Get Language":
            CreekInterFace.instance.getLanguage { model in
                self.view.hideRemark()
                let json = try? model.jsonString()
                if let str = json{
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "System operation":
            CreekInterFace.instance.setSystem(type: 1) {
                self.view.hideRemark()
                self.textView.text = "success"
            } failure: { code, message in
                self.view.hideRemark()
                self.textView.text = message
            }
            break
        case "Query activity data":
            CreekInterFace.instance.getActivityNewTimeData(startTime: "2023-08-01", endTime: "2023-08-03") { model in
                if model.code == 0{
                    self.view.hideRemark()
                    self.textView.text = "success"
                    let json = try? JSONEncoder().encode(model.data)
                    if let data = json, let str = String(data: data, encoding: .utf8) {
                        dispatch_main_sync_safe {
                            self.textView.text = str
                        }
                    }
                }
            }
            break
            
        case "Query sleep data":
            CreekInterFace.instance.getSleepNewTimeData(startTime: "2023-08-01", endTime: "2023-08-03") { model in
                if model.code == 0{
                    self.view.hideRemark()
                    self.textView.text = "success"
                    let json = try? JSONEncoder().encode(model.data)
                    if let data = json, let str = String(data: data, encoding: .utf8) {
                        dispatch_main_sync_safe {
                            self.textView.text = str
                        }
                    }
                }
            }
            break
        case "Query heart rate data":
            CreekInterFace.instance.getHeartRateNewTimeData(startTime: "2023-08-01", endTime: "2023-08-03") { model in
                if model.code == 0{
                    self.view.hideRemark()
                    self.textView.text = "success"
                    let json = try? JSONEncoder().encode(model.data)
                    if let data = json, let str = String(data: data, encoding: .utf8) {
                        dispatch_main_sync_safe {
                            self.textView.text = str
                        }
                    }
                }
            }
            break
        case "Query pressure data":
            CreekInterFace.instance.getStressNewTimeData(startTime: "2023-08-01", endTime: "2023-08-03") { model in
                if model.code == 0{
                    self.view.hideRemark()
                    self.textView.text = "success"
                    let json = try? JSONEncoder().encode(model.data)
                    if let data = json, let str = String(data: data, encoding: .utf8) {
                        dispatch_main_sync_safe {
                            self.textView.text = str
                        }
                    }
                }
            }
            break
        case "Query noise data":
            CreekInterFace.instance.getNoiseNewTimeData(startTime: "2023-08-01", endTime: "2023-08-03") { model in
                if model.code == 0{
                    self.view.hideRemark()
                    self.textView.text = "success"
                    let json = try? JSONEncoder().encode(model.data)
                    if let data = json, let str = String(data: data, encoding: .utf8) {
                        dispatch_main_sync_safe {
                            self.textView.text = str
                        }
                    }
                }
            }
            break
        case "Query blood oxygen data":
            CreekInterFace.instance.getSpoNewTimeData(startTime: "2023-08-01", endTime: "2023-08-03") { model in
                if model.code == 0{
                    self.view.hideRemark()
                    self.textView.text = "success"
                    let json = try? JSONEncoder().encode(model.data)
                    if let data = json, let str = String(data: data, encoding: .utf8) {
                        dispatch_main_sync_safe {
                            self.textView.text = str
                        }
                    }
                }
            }
            break
            
        case "Exercise record list":
            CreekInterFace.instance.getSportRecord(nil) { model in
                if model.code == 0{
                    self.view.hideRemark()
                    self.textView.text = "success"
                    let json = try? JSONEncoder().encode(model.data)
                    if let data = json, let str = String(data: data, encoding: .utf8) {
                        dispatch_main_sync_safe {
                            self.textView.text = str
                        }
                    }
                }
            }
            break
            
        case "Query exercise details":
            CreekInterFace.instance.getSportDetails(id:1){ model in
                if model.code == 0{
                    self.view.hideRemark()
                    self.textView.text = "success"
                    let json = try? JSONEncoder().encode(model.data)
                    if let data = json, let str = String(data: data, encoding: .utf8) {
                        dispatch_main_sync_safe {
                            self.textView.text = str
                        }
                    }
                }
            }
            break
            
        case "Range query exercise record":
            CreekInterFace.instance.getSportTimeData(startTime: "2023-08-01", endTime: "2023-08-03",nil) { model in
                if model.code == 0{
                    self.view.hideRemark()
                    self.textView.text = "success"
                    let json = try? JSONEncoder().encode(model.data)
                    if let data = json, let str = String(data: data, encoding: .utf8) {
                        dispatch_main_sync_safe {
                            self.textView.text = str
                        }
                    }
                }
            }
            break
            
        case "Delete exercise record":
            CreekInterFace.instance.delSportRecord(id: 1) { model in
                self.view.hideRemark()
                self.textView.text = "success"
                let json = try? JSONEncoder().encode(model)
                if let data = json, let str = String(data: data, encoding: .utf8) {
                    dispatch_main_sync_safe {
                        self.textView.text = str
                    }
                }
             }
            break
            
            ///"获取语言","设置语言",
            
        default:
            break
            
        }
    }
}
