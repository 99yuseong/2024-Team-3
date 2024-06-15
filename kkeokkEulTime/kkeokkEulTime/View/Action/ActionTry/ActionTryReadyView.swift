import SwiftUI

struct ActionTryReadyView: View {
    @State private var workItem: DispatchWorkItem?
    
    let action: ActionModel
    
    var body: some View {
        ZStack {
            Color(hex: "323232").ignoresSafeArea()
            
            VStack(spacing: 12) {
                Text("오른손으로 아이폰을 잡아주세요")
                    .font(.custom(Pretendard.semiBold.rawValue, size: 24))
                
                Spacer()
                Spacer()
                
                Image("Grip")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 462)
                
                Spacer()
                Spacer()
                
                Text(action.readySentence)
                    .font(.custom(Pretendard.semiBold.rawValue, size: 18))
                    .foregroundStyle(Color(hex: "E8F5EF"))
                
                Spacer()
            }
            .foregroundStyle(.white)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    self.workItem?.cancel()
                    self.workItem = nil
                    NavigationManager.shared.pop(to: .actionDetail(actionModel: action))
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .font(.system(size: 17))
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.vertical, 11)
                }
                .frame(width: 44, height: 44)
            }
        }
        .onAppear {
            let item = DispatchWorkItem {
                NavigationManager.shared.push(to: .actionTryCountDown(actionModel: action))
            }
            self.workItem = item
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: item)
        }
    }
}

#Preview {
    NavigationStack {
        ActionTryReadyView(action: ActionModel.details.first!)
    }
}
