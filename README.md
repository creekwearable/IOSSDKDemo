## IOS Bluetooth Management SDK

### 一、development guide
  language support：Swift
  
  Version：Swift 5  --------IOS 13.0
    

#### Step 1：Add dependent libraries
● [CreekSDK.framework](https://creekwearable.github.io/static/IOSSDKVersion/1.0.0/CreekSDK.zip)

<img src="https://creekwearable.github.io/static/image/1.png">

● Add resource pack Swift Protobuf

<img src="https://creekwearable.github.io/static/image/2.png">

<img src="https://creekwearable.github.io/static/image/3.png">

#### Step 2：Rights Profile

<img src="https://creekwearable.github.io/static/image/4.png">

<img src="https://creekwearable.github.io/static/image/5.png">

<img src="https://creekwearable.github.io/static/image/6.png">


### 二、SDK usage

#### initialization
##### CreekInterFace.instance.initSDK()

#### Whether to support Zilian authorization code verification
##### type 1 verify 0 do not verify
    CreekInterFace.instance.authorization(type: 0);

#### Automatic connection configuration
##### type 1 supports 0 to cancel self-connection
    CreekInterFace.instance.autoConnect(type: 1);
    
#### Monitor Bluetooth device status
        CreekInterFace.instance.listenDeviceState { status, deviceName in
            print("\(status) \(deviceName)")
        }

#### scanning 
##### ●timeOut   Execution time length to stop scanning optional default 15s

       CreekInterFace.instance.scan(timeOut: 15) { data in
            self.devides = data
            self.tableView.reloadData()
        } endScan: {
            print("end of scan")
       }
        
#### stop scanning
##### CreekInterFace.instance.stopScan()

#### connect
#####● id id Bluetooth device identification
      CreekInterFace.instance.connect(id: device?.id ?? "") { isBool in
              if isBool{
              ///Success
              }else{
              ///Failure
              }
      }
      
    
#### Disconnect
         CreekInterFace.instance.disconnect {
                    
                } failure: { code, message in
                    
                }
                
#### bind device  
#####● direct binding
     
     CreekInterFace.instance.bindingDevice(bindType: .binNormal, id: nil, code: nil) {
                print("Success")
            } failure: {
                print("Failure")
            }
           
           
            
#####● Pair binding
           ///The first step is to send commands to the firmware, and the firmware displays
            the pairing code 1234
           CreekInterFace.instance.bindingDevice(bindType: .bindPairingCode, id: nil, code: nil) {
                ///here is not returned
            } failure: {
                
            }
            
            ///Step 2 Enter the firmware pairing code code: 1234
           CreekInterFace.instance.bindingDevice(bindType: .bindPairingCode, id: nil, code:"1234") {
                ///Success
            } failure: {
                ///Failure
            }
            
            
### 三、basic instruction 

- []() 
     
  - Get Device Information
     - [getFirmware](#getFirmware)
  - Get Device Bluetooth Status
     - [bluetoothStatus](#bluetoothStatus)
  - Get Language
     - [getLanguage](#getLanguage)
  - Set Language
     - [setLanguage](#setLanguage)
  - Sync Time
     - [syncTime](#syncTime)
  - Get Time
     - [getTime](#getTime)
  - Get User Information
     - [getUserInfo](#getUserInfo)
  - Set User Information
     - [setUserInfo](#setUserInfo)
 - Get Alarm Clock
     - [getAlarm](#getAlarm)
  - Set Alarm Clock
     - [setAlarm](#setAlarm)
  - Get Do Not Disturb
     - [getDisturb](#getDisturb)
  - Set Do Not Disturb
     - [setDisturb](#setDisturb)
  - Get Screen Brightness
     - [getScreen](#getScreen)
  - Set Screen Brightness
     - [setScreen](#setScreen)
  - Get Health Monitoring
     - [getMonitor](#getMonitor)
  - Health monitoring setting
     - [setMonitor](#setMonitor)
  - Sleep monitoring acquisition
     - [getSleepMonitor](#getSleepMonitor)
  - Sleep monitoring setting
     - [setSleepMonitor](#setSleepMonitor)
  - World clock acquisition
     - [getWorldTime](#getWorldTime)
  - World clock setting
     - [setWorldTime](#setWorldTime)
  - Message switch query
     - [getMessageOnOff](#getMessageOnOff)
  - Message switch setting
     - [setMessageOnOff](#setMessageOnOff)
  - Set weather
     - [setWeather](#setWeather)
  - Incoming call configuration query
     - [getCall](#getCall)
  - Incoming call configuration settings
     - [setCall](#setCall)
  - Contacts query
     - [getContacts](#getContacts)
  - Contacts settings
     - [setContacts](#setContacts)
  - Exercise self-identification query
     - [getSportIdentification](#getSportIdentification)
  - Exercise self-identification settings
     - [setSportIdentification](#setSportIdentification)
  - Exercise sub-item data query
     - [getSportSub](#getSportSub)
  - Exercise sub-item data setting
     - [setSportSub](#setSportSub)
  - Inquiry about the arrangement order of device exercise
     - [getSportSort](#getSportSort)     
  - Setting the arrangement order of device exercise
     - [setSportSort](#setSportSort)
  - Get the type of exercise supported by the device
     - [getSportType](#getSportType)
  - Setting the heart rate interval
     - [setSportHeartRate](#setSportHeartRate)
  - Delete the dial
     - [delWatchDial](#delWatchDial)     
  - Query the dial
     - [getWatchDial](#getWatchDial)    
  - Set the dial
     - [setWatchDial](#setWatchDial)     
  - System operation
     - [setSystem](#setSystem)       
     
     
     
     
    
####  <a name="getFirmware"></a>  Get Device Information
   model： [protocol_device_info](http://macdown.uranusjr.com "Title")
   
            CreekInterFace.instance.getFirmware { model in
               /// model：protocol_device_info
            } failure: { code, message in
            
            }
            
            
    
#### <a name="bluetoothStatus"></a> Get Device Bluetooth Status
            
                <!--model：protocol_connect_status_inquire_reply-->
              CreekInterFace.instance.bluetoothStatus { model in
                        
                } failure: { code, message in
               
            }
            
#### <a name="getLanguage"></a> Get Language
            
       CreekInterFace.instance.getLanguage { model in
                          } 
                          failure: { code, message in
            }
            
#### <a name="setLanguage"></a> Set Language
            
       CreekInterFace.instance.setLanguage(type: .japanese) {
                           } failure: { code, message in
             
            }   
              
#### <a name="syncTime"></a>  Sync Time
            
            CreekInterFace.instance.syncTime {
            } failure: { code, message in
            }   
            
#### <a name="getTime"></a> Get Time
            
            CreekInterFace.instance.getTime { model in

            } failure: { code, message in

            }
            
#### <a name="getUserInfo"></a> Get User Information
           
             CreekInterFace.instance.getUserInfo { model in

            } failure: { code, message in
             
            }          
            
#### <a name="setUserInfo"></a> Set User Information
           
                var data = protocol_user_info_operate
                data.personalInfo.year = 2024
                data.personalInfo.month = 11
                data.goalSetting.workoutDay = 7
                data.goalSetting.steps = 100
                data.perferences.distUnit = 1
                data.goalSetting.notifyFlag = .close
                ................................
                CreekInterFace.instance.setUserInfo(model: data) {
                   
                } failure: { code, message in
                   
                }            
   
#### <a name="getAlarm"></a> Get Alarm Clock
           
            CreekInterFace.instance.getAlarm{ model in
                            
            } failure: { code, message in
              
            } 
               
  
#### <a name="setAlarm"></a> Set Alarm Clock
           
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
                 
                } failure: { code, message in
                   
                }
                
#### <a name="getDisturb"></a> Get Do Not Disturb
           
            CreekInterFace.instance.getDisturb{ model in
                            
                            } failure: { code, message in
              
            }
              
              
#### <a name="setDisturb"></a> Set Do Not Disturb
           
            var model = protocol_disturb_operate()
            model.disturbOnOff = true
            CreekInterFace.instance.setDisturb(model: model) {
                
            } failure: { code, message in
                
            }       
            
            
#### <a name="getScreen"></a> Get Screen Brightness
           
            CreekInterFace.instance.getScreen{ model in
                
                            } failure: { code, message in
                
            }              
              
#### <a name="setScreen"></a> Set Screen Brightness
           
            var model =  protocol_screen_brightness_operate()
            model.nightAutoAdjust.startHour = 20
            CreekInterFace.instance.setScreen(model: model) {
                
            } failure: { code, message in
                
            }   
           
           
#### <a name="getScreen"></a> Get Health Monitoring
           
            ar data =  protocol_health_monitor_operate()
            data.healthType = health_type.heartRate
            CreekInterFace.instance.getMonitor(operate: data) { model in
                            } failure: { code, message in
               
            }
              
#### <a name="setScreen"></a> Health monitoring setting
           
            var data =  protocol_health_monitor_operate()
            data.healthType = health_type.heartRate
            data.measurementInterval = 5
            CreekInterFace.instance.setMonitor(model: data) {
               
            } failure: { code, message in
                
            }   
            
#### <a name="getSleepMonitor"></a> Sleep monitoring acquisition
           
            CreekInterFace.instance.getSleepMonitor { model in

            } failure: { code, message in
              
            }            }
              
#### <a name="setSleepMonitor"></a> Sleep monitoring setting
           
            var data =  protocol_sleep_monitor_operate()
            data.switchFlag = true
            CreekInterFace.instance.setSleepMonitor(model: data) {
                
            } failure: { code, message in
                
            } 
            
#### <a name="getWorldTime"></a> World clock acquisition
           
             CreekInterFace.instance.getWorldTime { model in
                            } failure: { code, message in
                
            }
              
#### <a name="setWorldTime"></a> World clock setting
           
            var data =  protocol_world_time_operate()
             var item = protocol_world_time_item()
            item.cityName =  "shenzheng".data(using: .utf8)!
            item.offestMin = 120
            data.worldTimeItem.append(item)
            CreekInterFace.instance.setWorldTime(model: data) {
                
            } failure: { code, message in
               
            }
            
#### <a name="getMessageOnOff"></a> Message switch query
           
             CreekInterFace.instance.getMessageOnOff { model in
                           } failure: { code, message in
                
            }
              
#### <a name="setMessageOnOff"></a> Message switch setting
           
            var data =  protocol_message_notify_switch()
            data.notifySwitch = true
            CreekInterFace.instance.setMessageOnOff(model: data) {
               
            } failure: { code, message in
                            }            }            
#### <a name="setWeather"></a> Set weather
           
            var data =  protocol_weather_operate()
            data.switchFlag = true
            var item = protocol_weather_detail_data_item()
            item.hour = 14
            item.curTemp = 30
            item.curMaxTemp = 33
            item.curMinTemp = 26
            data.detailDataItem.append(item)
            CreekInterFace.instance.setWeather(model: data) {
                
            } failure: { code, message in
                
            }                                
                            
#### <a name="getCall"></a> Incoming call configuration query
           
             CreekInterFace.instance.getCall { model in
               
            } failure: { code, message in
                            }
              
#### <a name="setCall"></a> Incoming call configuration settings
           
            var data =  protocol_call_switch()
            data.callSwitch = true
            data.callDelay = 5
            CreekInterFace.instance.setCall(model: data) {
              
            } failure: { code, message in
                
            }                             
                            
#### <a name="getContacts"></a> Contacts query
           
             CreekInterFace.instance.getContacts { model in
                            } failure: { code, message in
               
            }
              
#### <a name="setContacts"></a> Contacts settings
           
            var data =  protocol_frequent_contacts_operate()
            var item =  protocol_frequent_contacts_item()
            item.phoneNumber = "12345678912".data(using: .utf8)!
            item.contactName = "bean".data(using: .utf8)!
            data.contactsItem.append(item)
            CreekInterFace.instance.setContacts(model: data) {
               
            } failure: { code, message in
                
            }                        
                                                       
                            
#### <a name="getSportIdentification"></a> Exercise self-identification query
           
             CreekInterFace.instance.getSportIdentification { model in
                           } failure: { code, message in
                
            }
              
#### <a name="setSportIdentification"></a> Exercise self-identification settings
           
            var data =  protocol_exercise_intelligent_recognition()
            data.walkTypeSwitch = true
            CreekInterFace.instance.setSportIdentification(model: data) {
               
            } failure: { code, message in
                            }                    
                            
#### <a name="getSportSub"></a> Exercise sub-item data query
           
              CreekInterFace.instance.getSportSub { model in
                            } failure: { code, message in
                            }
              
#### <a name="setSportSub"></a> Exercise sub-item data setting
           
            var data =  protocol_exercise_sporting_param_sort()
            data.sportType = UInt32(sport_type.barbell.rawValue)
            CreekInterFace.instance.setSportSub(model: data) {
                
            } failure: { code, message in
                
            }                   
                            
#### <a name="getSportSort"></a> Inquiry about the arrangement order of device exercise
           
             CreekInterFace.instance.getSportSort { model in
                            } failure: { code, message in
                
            }

              
#### <a name="setSportSort"></a> Setting the arrangement order of device exercise
           
            var data =  protocol_exercise_sport_mode_sort()
            data.sportItems.append(sport_type.badminton)
            CreekInterFace.instance.setSportSort(model: data) {
               
            } failure: { code, message in
                           }                     
                            
#### <a name="getSportType"></a> Get the type of exercise supported by the device
           
             CreekInterFace.instance.getSportType { model in
                            } failure: { code, message in
               
            }

              
#### <a name="setSportHeartRate"></a> Setting the heart rate interval
           
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

              
#### <a name="delWatchDial"></a> Delete the dial
           
            var data =  protocol_watch_dial_plate_operate()
            data.dialName = ["1"]
            CreekInterFace.instance.delWatchDial(model: data) {
                
            } failure: { code, message in
                
            }         
                            
#### <a name="getWatchDial"></a> Query the dial
           
             CreekInterFace.instance.getWatchDial { model in
                           } failure: { code, message in
              }

              
#### <a name="setWatchDial"></a> Set the dial
           
            var data =  protocol_watch_dial_plate_operate()
            data.dialName = ["1"]
            CreekInterFace.instance.setWatchDial(model: data) {
               
            } failure: { code, message in
                            }                   
                            
#### <a name="setSystem"></a> System operation
           
            CreekInterFace.instance.setSystem(type: 1) {
               
            } failure: { code, message in
                
            }                          
                            
###三、Query local data                           
                            
   - Query activity data
     - [getActivityNewTimeData](#getActivityNewTimeData)     
  - Query sleep data
     - [getSleepNewTimeData](#getSleepNewTimeData)    
  - Query heart rate data
     - [getHeartRateNewTimeData](#getHeartRateNewTimeData)     
  - Query pressure data
     - [getStressNewTimeData](#getStressNewTimeData)    
  - Query noise data
     - [getNoiseNewTimeData](#getNoiseNewTimeData)     
  - Query blood oxygen data
     - [getSpoNewTimeData](#getSpoNewTimeData)    
  - Exercise record list
     - [getSportRecord](#getSportRecord)     
  - Query exercise details
     - [getSportDetails](#getSportDetails)    
  - Range query exercise record
     - [getSportTimeData](#getSportTimeData)     
  - Delete exercise record
     - [delSportRecord](#delSportRecord)  
                          
                            
#### <a name="getActivityNewTimeData"></a> Query activity data
           
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
              
#### <a name="getSleepNewTimeData"></a> Query sleep data
           
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
                            
#### <a name="getHeartRateNewTimeData"></a> Query heart rate data
           
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

              
#### <a name="getStressNewTimeData"></a> Query pressure data
           
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
                            
#### <a name="getNoiseNewTimeData"></a> Query noise data
           
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

              
#### <a name="getSpoNewTimeData"></a> Query blood oxygen data
           
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

              
#### <a name="getSportRecord"></a> Exercise record list
           
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
                            
#### <a name="getSportDetails"></a> Query exercise details
           
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

              
#### <a name="getSportTimeData"></a> Range query exercise record
           
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
                            
#### <a name="delSportRecord"></a> Delete exercise record
           
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
                            
                            
                            
                            
                            
                            
                            
                            