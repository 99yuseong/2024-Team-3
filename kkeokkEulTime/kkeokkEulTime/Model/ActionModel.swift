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
    static let all = ActionModel(
        type: .nextLevel,
        selectionImage: "nextLevel",
        originalImage: "nextLevel_fill",
        readyImage: "nextLevel_ready",
        tutorialVideo: "nextLevel",
        selectionTitle: "전체 재생",
        actionCount: 10,
        giftSetenceShort: "에스파로 데뷔할 확률 높아짐",
        giftSetenceLong: "손목도 건강해지고\n에스파로 데뷔할 확률이 높아졌어요",
        giftImage: "nextLevel_gift",
        giftTitle: ["IT업계의", "SM상"],
        selectionDescription: "손목이 잘 꺾이는 카리나처럼..\n손목터널 증후군 자가 진단을 해보세요",
        readySentence: "손목을 뒤로 젖혀 스트레칭을 준비하세요",
        practiceImages: ["nextLevel_practice_1", "nextLevel_practice_2"]
    )
    
    static let nextLevel = ActionModel(
        type: .nextLevel,
        selectionImage: "nextLevel",
        originalImage: "nextLevel_fill",
        readyImage: "nextLevel_ready",
        tutorialVideo: "nextLevel",
        selectionTitle: "노려보자 제 5의 에스파 멤버",
        actionCount: 10,
        giftSetenceShort: "에스파로 데뷔할 확률 높아짐",
        giftSetenceLong: "손목도 건강해지고\n에스파로 데뷔할 확률이 높아졌어요",
        giftImage: "nextLevel_gift",
        giftTitle: ["IT업계의", "SM상"],
        selectionDescription: "손목이 잘 꺾이는 카리나처럼..\n손목터널 증후군 자가 진단을 해보세요",
        readySentence: "손목을 뒤로 젖혀 스트레칭을 준비하세요",
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
        giftSetenceShort: "문의는 디엠으로",
        giftSetenceLong: "손님에게 예의를 갖춰달라고\n말할 수 있는 용기 탑제",
        giftImage: "getOut_gift",
        giftTitle: ["문의는", "디엠으로"],
        selectionDescription: "손목을 부드럽게 돌리는 것만으로도\n손목 바깥쪽 시큰거리는 통증을 줄일 수 있어요",
        readySentence: "손바닥을 붙여 스트레칭을 준비하세요",
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
        giftSetenceShort: "암살 실력 습득",
        giftSetenceLong: "평소 마음에 담아두던 그이를/n시원하게 암살",
        giftImage: "cutter_gift",
        giftTitle: ["사수님", "안마 해드릴까요?"],
        selectionDescription: "경직된 손목을 풀어주어\n손목 안쪽 찌릿한 통증을 줄일 수 있어요",
        readySentence: "팔을 뻗어서 스트레칭을 준비하세요",
        practiceImages: ["cutter_practice_1", "cutter_practice_2"]
    )
    
    static let shake = ActionModel(
        type: .shake,
        selectionImage: "shake",
        originalImage: "shake_fill",
        readyImage: "shake_ready",
        tutorialVideo: "shake",
        selectionTitle: "손목 쉐이크",
        actionCount: 10,
        giftSetenceShort: "물기를 털어 손이 보송해짐",
        giftSetenceLong: "손목도 아끼고 나무도 아끼고\n단, 너무 쎄게 하진 마세요",
        giftImage: "shake_gift",
        giftTitle: ["손 씻고", "실천해봐요"],
        selectionDescription: "손목에게 휴식을!\n손목 근육과 신경을 이완시켜\n손 저림 증상을 예방할 수 있어요",
        readySentence: "팔꿈치를 구부려 스트레칭을 준비하세요",
        practiceImages: ["shake_practice_1", "shake_practice_2"]
    )
    
    static let woiWoi = ActionModel(
        type: .woiWoi,
        selectionImage: "woiWoi",
        originalImage: "woiWoi_fill",
        readyImage: "woiWoi_ready",
        tutorialVideo: "woiWoi",
        selectionTitle: "후진 안내 마스터",
        actionCount: 10,
        giftSetenceShort: "베스트 드라이버가 됨",
        giftSetenceLong: "좀 더 뒤로,, 더 더 스탑 스탑,,,",
        giftImage: "woiWoi_gift",
        giftTitle: ["오라이", "오라이"],
        selectionDescription: "손목 힘줄과 신경을 강하게 스트레칭하세요\n약한 손목을 튼튼하게 만들 수 있어요",
        readySentence: "팔을 뻗어서 스트레칭을 준비하세요",
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
