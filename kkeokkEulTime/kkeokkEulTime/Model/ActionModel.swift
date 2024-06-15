import Foundation

struct ActionModel: Hashable {
    let type: ActionType
    let selectionImage: String
    let originalImage: String
    let readyImage: String
    let tutorialVideo: String
    let selectionTitle: String
    let actionCount: Int
    let giftSetenceShort: String
    let giftSetenceLong: String
    let giftImage: String
    let giftTitle: [String]
    let selectionDescription: String
    let readySentence: String
    let practiceImages: [String]
}

extension ActionModel {
    
}

extension ActionModel {
    static let all = ActionModel(
        type: .all,
        selectionImage: "all",
        originalImage: "all_fill",
        readyImage: "all_ready",
        tutorialVideo: "all",
        selectionTitle: "전체 재생",
        actionCount: 10,
        giftSetenceShort: "이수만이 잡아갈 확률 높아짐",
        giftSetenceLong: "손목도 건강해지고\n이수만이 잡아갈 확률이 높아졌어요",
        giftImage: "all_gift",
        giftTitle: ["IT업계의", "SM상"],
        selectionDescription: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기",
        readySentence: "팔을 뻗어서 스트레칭을 준비해주세요",
        practiceImages: ["all_practice_1", "all_practice_2"]
    )
    
    static let nextLevel = ActionModel(
        type: .nextLevel,
        selectionImage: "nextLevel",
        originalImage: "nextLevel_fill",
        readyImage: "nextLevel_ready",
        tutorialVideo: "nextLevel",
        selectionTitle: "노려보자 카리나",
        actionCount: 10,
        giftSetenceShort: "이수만이 잡아갈 확률 높아짐",
        giftSetenceLong: "손목도 건강해지고\n이수만이 잡아갈 확률이 높아졌어요",
        giftImage: "nextLevel_gift",
        giftTitle: ["IT업계의", "SM상"],
        selectionDescription: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기",
        readySentence: "팔을 뻗어서 스트레칭을 준비해주세요",
        practiceImages: ["nextLevel_practice_1", "nextLevel_practice_2"]
    )
    
    static let getOut = ActionModel(
        type: .getOut,
        selectionImage: "getOut",
        originalImage: "getOut_fill",
        readyImage: "getOut_ready",
        tutorialVideo: "getOut",
        selectionTitle: "나가주세요",
        actionCount: 10,
        giftSetenceShort: "이수만이 잡아갈 확률 높아짐",
        giftSetenceLong: "손목도 건강해지고\n이수만이 잡아갈 확률이 높아졌어요",
        giftImage: "getOut_gift",
        giftTitle: ["IT업계의", "SM상"],
        selectionDescription: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기",
        readySentence: "팔을 뻗어서 스트레칭을 준비해주세요",
        practiceImages: ["getOut_practice_1", "getOut_practice_2"]
    )
    
    static let cutter = ActionModel(
        type: .cutter,
        selectionImage: "cutter",
        originalImage: "cutter_fill",
        readyImage: "cutter_ready",
        tutorialVideo: "cutter",
        selectionTitle: "썰어버려",
        actionCount: 10,
        giftSetenceShort: "이수만이 잡아갈 확률 높아짐",
        giftSetenceLong: "손목도 건강해지고\n이수만이 잡아갈 확률이 높아졌어요",
        giftImage: "cutter_gift",
        giftTitle: ["IT업계의", "SM상"],
        selectionDescription: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기",
        readySentence: "팔을 뻗어서 스트레칭을 준비해주세요",
        practiceImages: ["cutter_practice_1", "cutter_practice_2"]
    )
    
    static let shake = ActionModel(
        type: .shake,
        selectionImage: "shake",
        originalImage: "shake_fill",
        readyImage: "shake_ready",
        tutorialVideo: "shake",
        selectionTitle: "털어",
        actionCount: 10,
        giftSetenceShort: "이수만이 잡아갈 확률 높아짐",
        giftSetenceLong: "손목도 건강해지고\n이수만이 잡아갈 확률이 높아졌어요",
        giftImage: "shake_gift",
        giftTitle: ["IT업계의", "SM상"],
        selectionDescription: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기",
        readySentence: "팔을 뻗어서 스트레칭을 준비해주세요",
        practiceImages: ["shake_practice_1", "shake_practice_2"]
    )
    
    static let woiWoi = ActionModel(
        type: .woiWoi,
        selectionImage: "woiWoi",
        originalImage: "woiWoi_fill",
        readyImage: "woiWoi_ready",
        tutorialVideo: "woiWoi",
        selectionTitle: "워이워이",
        actionCount: 10,
        giftSetenceShort: "이수만이 잡아갈 확률 높아짐",
        giftSetenceLong: "손목도 건강해지고\n이수만이 잡아갈 확률이 높아졌어요",
        giftImage: "woiWoi_gift",
        giftTitle: ["IT업계의", "SM상"],
        selectionDescription: "손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기",
        readySentence: "팔을 뻗어서 스트레칭을 준비해주세요",
        practiceImages: ["woiWoi_practice_1", "woiWoi_practice_2"]
    )
    
    static let details = [nextLevel, getOut, cutter, shake, woiWoi]
    
    var nextAction: ActionModel {
        switch self.type {
        case .nextLevel:
            return ActionModel.getOut
        case .getOut:
            return ActionModel.cutter
        case .cutter:
            return ActionModel.shake
        case .shake:
            return ActionModel.woiWoi
        case .woiWoi:
            return ActionModel.nextLevel
        default:
            return ActionModel.getOut
        }
    }
}
