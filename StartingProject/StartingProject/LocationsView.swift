import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    
    var body: some View {
        VStack {
           LittleLemonLogo() // 1
                .padding(.top, 50)
           
                //Text(self.reservationEnabled ? "Reservation not enabled" : "Show Reservation")
            if (model.displayingReservationForm==true){
                
                Text("Reservation Details")
                    .padding([.leading, .trailing], 40)
                    .padding([.top, .bottom], 8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                
            } else
            {
                Text("Select a Location")
                    .padding([.leading, .trailing], 40)
                    .padding([.top, .bottom], 8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
            }
            
            NavigationView {
             
                List(model.restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant)
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            
        }
        .padding(.top, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}

