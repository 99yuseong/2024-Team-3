import Foundation

struct ActionModel {
    let image: String
    let filledImage: String
    let title: String
    let count: Int
    let gift: String
    let description: String
}

extension ActionModel {
    static let all = ActionModel(
        image: "all",
        filledImage: "All_fill",
        title: "전체 재생",
        count: 10,
        gift: "이수만이 잡아갈 확률 높아짐",
        description: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기"
    )
    
    static let details = [
        ActionModel(
            image: "nextLevel",
            filledImage: "nextLevel_fill",
            title: "노려보자 카리나",
            count: 10,
            gift: "이수만이 잡아갈 확률 높아짐",
            description: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기"
        ),
        ActionModel(
            image: "getOut",
            filledImage: "getOut_fill",
            title: "나가주세요",
            count: 10,
            gift: "이수만이 잡아갈 확률 높아짐",
            description: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기"
        ),
        ActionModel(
            image: "cutter",
            filledImage: "cutter_fill",
            title: "썰어버려",
            count: 10,
            gift: "이수만이 잡아갈 확률 높아짐",
            description: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기"
        ),
        ActionModel(
            image: "shake",
            filledImage: "shake_fill",
            title: "털어",
            count: 10,
            gift: "이수만이 잡아갈 확률 높아짐",
            description: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기"
        ),
        ActionModel(
            image: "woiWoi",
            filledImage: "woiWoi_fill",
            title: "워이워이",
            count: 10,
            gift: "이수만이 잡아갈 확률 높아짐",
            description: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기"
        )
    ]
}
