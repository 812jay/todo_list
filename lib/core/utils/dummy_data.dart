class DummyData {
  static List<Map<String, dynamic>> groupList = [
    {
      "groupTitle": "할 일",
      "itemList": [
        {
          "title": "새로운 블로그 글 작성",
          "assignee": "김철수",
          "content":
              "다음 주에 발행할 블로그 글 주제를 정하고, 키워드 분석을 통해 SEO에 적합한 콘텐츠를 기획한 후 초안을 작성합니다. 또한 이미지나 그래프 등 시각 자료에 대한 아이디어를 포함시킬 예정입니다.",
          "createdAt": DateTime.now(),
          "updatedAt": DateTime.now(),
        },
        {
          "title": "3월 마케팅 캠페인 자료 준비",
          "assignee": "박영희",
          "content":
              "3월에 진행할 마케팅 캠페인의 자료를 준비합니다. 캠페인 컨셉, 광고 문구, 타겟 고객층 분석 자료, 예상 효과 등을 포함하여 발표 자료를 제작합니다.",
          "createdAt": DateTime.now(),
          "updatedAt": DateTime.now(),
        }
      ],
    },
    {
      "groupTitle": "급한 일",
      "itemList": [
        {
          "title": "고객 지원 요청 긴급 처리",
          "assignee": "최민호",
          "content":
              "VIP 고객의 시스템 사용 중 발생한 심각한 오류를 긴급히 해결합니다. 문제의 원인을 분석하고, 고객에게 즉시 해결 방안을 제공하며, 필요한 경우 관련 팀과 협력하여 신속히 대처합니다.",
          "createdAt": DateTime.now(),
          "updatedAt": DateTime.now(),
        }
      ],
    },
    {
      "groupTitle": "진행 중",
      "itemList": [
        {
          "title": "UI/UX 디자인 리서치",
          "assignee": "이서연",
          "content":
              "새로운 프로젝트를 위해 최신 UI/UX 디자인 트렌드를 조사하고, 유사한 서비스를 분석하여 참고할 만한 디자인 사례를 정리합니다. 최종적으로 이를 바탕으로 와이어프레임을 제작할 예정입니다.",
          "createdAt": DateTime.now(),
          "updatedAt": DateTime.now(),
        },
        {
          "title": "API 기능 기술 문서 작성",
          "assignee": "김지훈",
          "content":
              "새로 개발된 API 기능에 대한 상세 기술 문서를 작성합니다. 문서에는 사용 방법, 요청/응답 형식, 예제 코드, 주의사항 등을 포함하며, 개발자들이 쉽게 이해할 수 있도록 작성합니다.",
          "createdAt": DateTime.now(),
          "updatedAt": DateTime.now(),
        }
      ],
    },
    {
      "groupTitle": "완료한 일",
      "itemList": [
        {
          "title": "주간 보고서 작성 및 제출",
          "assignee": "홍길동",
          "content":
              "팀의 주간 성과와 진행 상황을 정리한 보고서를 작성하고, 각종 지표와 성과를 포함하여 경영진에게 제출했습니다. 주요 과제의 진행 상황과 다음 주 계획도 포함되어 있습니다.",
          "createdAt": DateTime.now(),
          "updatedAt": DateTime.now(),
        },
        {
          "title": "월간 목표 설정 회의 진행",
          "assignee": "이은지",
          "content":
              "팀원들과 월간 목표를 설정하기 위한 회의를 진행했습니다. 회의에서는 현재 진행 중인 프로젝트 상황을 점검하고, 이번 달에 달성해야 할 주요 목표와 세부 계획을 논의했습니다.",
          "createdAt": DateTime.now(),
          "updatedAt": DateTime.now(),
        }
      ]
    },
  ];

  //그룹 데이터
  // static List<AppFlowyGroupData> groupList = [
  //   AppFlowyGroupData(
  //     id: "할 일",
  //     items: [
  //       ParsedProductItemRes(
  //         title: "사용별 접근 데이터 제한",
  //         assignee: 'John Doe',
  //         createAt: DateTime.now(),
  //         updateteAt: DateTime.now(),
  //         content: '',
  //       ),
  //       ParsedProductItemRes(
  //         title: "사용별 접근 데이터 제한2",
  //         createAt: DateTime.now(),
  //         updateteAt: DateTime.now(),
  //         content: '',
  //       ),
  //     ],
  //     name: '할 일',
  //   ),
  //   AppFlowyGroupData(
  //     id: "급한 일",
  //     items: [
  //       ParsedProductItemRes(
  //         title: 'title',
  //         assignee: 'Jack',
  //         createAt: DateTime.now(),
  //         updateteAt: DateTime.now(),
  //       ),
  //     ],
  //     name: "급한 일",
  //   ),
  //   AppFlowyGroupData(
  //     id: "진행 중",
  //     items: [],
  //     name: "진행 중",
  //   ),
  //   AppFlowyGroupData(
  //     id: "완료한 일",
  //     items: [],
  //     name: "완료한 일",
  //   ),
  // ];
}
