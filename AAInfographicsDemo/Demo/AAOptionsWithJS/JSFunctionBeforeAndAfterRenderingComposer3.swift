//
//  JSFunctionBeforeAndAfterRenderingComposer3.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/11/22.
//  Copyright © 2024 An An. All rights reserved.
//


import AAInfographics

class JSFunctionBeforeAndAfterRenderingComposer3 {
    
    static func getJsonData(jsonFileName: String) -> Any? {
        guard let path = Bundle.main.path(forResource: jsonFileName, ofType: "json"),
              let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            print("失败❌❌❌ 📃JSON文件\(jsonFileName)解码失败")
            return nil
        }
        
        do {
            let jsonObj = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
            print("成功🔥🔥🔥 📃JSON文件\(jsonFileName)解码成功")
            return jsonObj
        } catch {
            print("失败❌❌❌ 📃JSON文件\(jsonFileName)解码失败")
            return nil
        }
    }
    
/**
 + (NSArray *)configureSeriesArray {
     // Get the data
     NSDictionary *activityDic = [self getJsonDataWithJsonFileName:@"synchronizedChartActivityData"];
     NSArray *datasets = activityDic[@"datasets"];
     
     NSMutableArray *finalDatasets = [NSMutableArray array];
     NSArray *colorsArr = @[@"#1e90ff", @"#ef476f", @"#ffd066", @"#04d69f", @"#25547c"];
     //Loop the data sets and create one chart each
     [datasets enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         // Add X values
         NSDictionary *dataset = (NSDictionary *)obj;
         NSArray *data = dataset[@"data"];
         NSMutableArray *newData = [NSMutableArray array];
         for (int i = 0; i < data.count; i++) {
             NSArray *val = data[i];
             NSArray *xData = activityDic[@"xData"];
             newData[i] = @[xData[i], val];
         }
         
         AASeriesElement *seriesElement = AASeriesElement.new
             .data(newData)
             .name(dataset[@"name"])
             .type(AAChartTypeArea)
             .color(colorsArr[idx]);
         
         finalDatasets[idx] = seriesElement;
     }];
     
     return finalDatasets;
 }
 */
    static func configureSeriesArray() -> [AASeriesElement] {
        let activityDic = getJsonData(jsonFileName: "synchronizedChartActivityData") as! [String: Any]
        let datasets = activityDic["datasets"] as! [[String: Any]]
        
        var finalDatasets = [AASeriesElement]()
        let colorsArr = ["#1e90ff", "#ef476f", "#ffd066", "#04d69f", "#25547c"]
        
        datasets.enumerated().forEach { (idx, obj) in
            let dataset = obj
            let data = dataset["data"] as! [Any]
            var newData = [[Any]]()
            for i in 0..<data.count {
                let val = data[i]
                let xData = activityDic["xData"] as! [Any]
                newData.append([xData[i], val])
            }
            
            let seriesElement = AASeriesElement()
                .data(newData)
                .name(dataset["name"] as? String ?? "")
//                .type(.area)
                .color(colorsArr[idx])
            
            finalDatasets.append(seriesElement)
        }
        
        return finalDatasets
    }
}
