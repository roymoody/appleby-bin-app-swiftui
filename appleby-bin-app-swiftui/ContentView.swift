//
//  ContentView.swift
//  appleby-bin-app-swiftui
//
//  Created by roy.moody on 18/03/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    
    let collectionSchedule: [(collectionDate: String, collectionType: String)] = [
        (collectionDate: "Tue 25 Sep 2024", collectionType: "Recycling"),
        (collectionDate: "Tue 02 Oct 2024", collectionType: "Refuse")
    ]
    
    
    
    
    var body: some View {
        
        let dateString = collectionSchedule[1].collectionDate
        let binType = collectionSchedule[1].collectionType
        //   let formattedDate = Text(getFullDate.formatDate(from: dateString))
        //   let monthNum = Text(getMonthString.formatDate(from: dateString))
        
        
        
        
        ZStack {
            Image("background2")
                .resizable()
            // .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()

            
            VStack {
                Spacer()
                Text("Your next collection is for")
                    .font(sizeClass == .compact ? .headline : .title)
                    .padding(.bottom, 4)
                    .foregroundColor(Color.init(white: 0.2))
                Text(binType)
                    .textCase(.uppercase)
                    .bold()
                    .font(sizeClass == .compact ? .largeTitle : .system(size: 60))
                //                Text("Full Date: \(getFullDate.formatDate(from: dateString))")
                //                Text("Month String: \(getMonthString.formatDate(from: dateString))")
                //                Text("Day: \(getDay.formatDate(from: dateString))")
                
                Spacer()
                Spacer()
//                ScrollView(.horizontal) {
//                    HStack {
                        BinView(dateString:dateString)
                       
//                    }
//                }
            }
            .padding(.bottom, 50)
            ZStack(alignment: .bottomTrailing) {
                Color.clear
                BlueBagView()
                    .padding(.trailing, sizeClass == .compact ? 30 : 160)
                    .padding(.bottom, sizeClass == .compact ? 45 : 20)
            }
        }
    }
    
}

struct BinView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    var dateString: String
    
    var body: some View {
        VStack {
            ZStack {
                Image("Blue")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: sizeClass == .compact ? 250 : 500)
                
                VStack (spacing:0) {
                    Text(FormatDate.Month(from: dateString))
                        .textCase(.uppercase)
                        .bold()
                        .foregroundColor(.white)
                        .font(sizeClass == .compact ? .headline : .title)
                        .frame(width: sizeClass == .compact ? 100 : 200,height: sizeClass == .compact ? 26 : 52 )
                        .background(Color.red)
                    
                    Text(FormatDate.Day(from: dateString))
                        .font(sizeClass == .compact ? .largeTitle : .system(size: 68))
                        .bold()
                        .foregroundColor(Color.init(white: 0.2))
                        .frame(width: sizeClass == .compact ? 100 : 200,height: sizeClass == .compact ? 60 : 120 )
                        .background(Color.white)
                }
                .cornerRadius(8)
                
                
            }
            
            
            .padding(.bottom, 30)
        }
        
    }
    // funcs  would be here
}


struct BlueBagView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        
        Image("blue_bag")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: sizeClass == .compact ? 130 : 260)
        
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct FormatDate {
    
    static func Day(from dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "EEE dd MMM yyyy"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd"
        
        if let date = inputFormatter.date(from: dateString) {
            return outputFormatter.string(from: date)
        } else {
            return "Invalid date"
        }
    }
    
    static func Month(from dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "EEE dd MMM yyyy"
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MM"
        
        if let date = inputFormatter.date(from: dateString) {
            switch outputFormatter.string(from: date) {
            case "01": return "Jan"
            case "02": return "Feb"
            case "03": return "Mar"
            case "04": return "Apr"
            case "05": return "May"
            case "06": return "Jun"
            case "07": return "Jul"
            case "08": return "Aug"
            case "09": return "Sept"
            case "10": return "Oct"
            case "11": return "Nov"
            case "12": return "Dec"
            default: return "Unknown"
            }
        } else {
            return "Unknown" // Make sure this line is present
        }
    }
}


//struct getDay {
//    static func formatDate(from dateString: String) -> String {
//        let inputFormatter = DateFormatter()
//        inputFormatter.dateFormat = "EEE dd MMM yyyy"
//
//        let outputFormatter = DateFormatter()
//        outputFormatter.dateFormat = "dd"
//
//        if let date = inputFormatter.date(from: dateString) {
//            return outputFormatter.string(from: date)
//        } else {
//            return "Invalid date"
//        }
//    }
//}
//
//
//
//struct getMonthString {
//    static func formatDate(from dateString: String) -> String {
//        let inputFormatter = DateFormatter()
//        inputFormatter.dateFormat = "EEE dd MMM yyyy"
//        let outputFormatter = DateFormatter()
//        outputFormatter.dateFormat = "MM"
//
//        if let date = inputFormatter.date(from: dateString) {
//            switch outputFormatter.string(from: date) {
//            case "01": return "Jan"
//            case "02": return "Feb"
//            case "03": return "Mar"
//            case "04": return "Apr"
//            case "05": return "May"
//            case "06": return "Jun"
//            case "07": return "Jul"
//            case "08": return "Aug"
//            case "09": return "Sept"
//            case "10": return "Oct"
//            case "11": return "Nov"
//            case "12": return "Dec"
//            default: return "Unknown"
//            }
//        } else {
//            return "Unknown" // Make sure this line is present
//        }
//    }
//
    // Struct to get full date if required
    //
    //struct getFullDate {
    //    static func formatDate(from dateString: String) -> String {
    //        let inputFormatter = DateFormatter()
    //        inputFormatter.dateFormat = "EEE dd MMM yyyy"
    //
    //        let outputFormatter = DateFormatter()
    //        outputFormatter.dateFormat = "dd/MM/yyyy"
    //
    //        if let date = inputFormatter.date(from: dateString) {
    //            return outputFormatter.string(from: date)
    //        } else {
    //            return "Invalid date"
    //        }
    //    }
    //}
//}

