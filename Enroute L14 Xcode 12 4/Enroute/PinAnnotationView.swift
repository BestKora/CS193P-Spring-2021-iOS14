//
//  PinAnnotationView.swift
//  Enroute
//
//  Created by Tatiana Kornilova on 25/01/2022.
//

import SwiftUI

struct PinAnnotationView: View {

  let title: String
  let subTitle: String
  var action: () -> Void
    
  @State private var showTitle = true
    
  var body: some View {
    VStack(spacing: 0) {
        VStack(spacing: 0) {
            Text(title).font(.callout)
            Text(subTitle).font(.caption)
                .foregroundColor(.secondary)
        }
        .fixedSize()
        .frame(width: .infinity, height: 30)
        .padding(5)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .opacity(showTitle ? 0 : 1)
 
        Image(systemName: "map.circle.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 15, height: 15)
          .font(.callout)
          .foregroundColor(.white)
          .padding(3)
          .background(Color.red)
          .cornerRadius(13)
          
         
          Image(systemName: "arrowtriangle.down.fill")
            .resizable()
            .scaledToFit()
            .font(.caption)
          .foregroundColor(.red)
          .frame(width: 6, height: 6)
          .offset(x: 0, y: -1)
    }
   // .background(Color.yellow)
    .padding(.bottom,51)
    
    .onTapGesture {
      withAnimation {
        showTitle.toggle()
        action()
      }
    }
    
  }
}


struct PinAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        PinAnnotationView(title: "Аэропорт Шереметьево", subTitle: "Привет!!", action: {})
    }
}

