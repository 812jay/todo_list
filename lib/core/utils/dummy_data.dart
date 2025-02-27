import 'package:cloud_firestore/cloud_firestore.dart';

class DummyData {
  static List<Map<String, dynamic>> productList = [
    {
      "groupTitle": "할 일",
      "itemList": [
        {
          "groupTitle": "할 일",
          "title": "신규 마이크로서비스 아키텍처 설계",
          "content":
              "현재 모놀리식 구조의 백엔드 시스템을 마이크로서비스로 전환하기 위한 아키텍처 설계. 서비스 분리 전략, 데이터베이스 분리 방안, API 게이트웨이 구성 등을 포함한 상세 설계 문서 작성.",
          "createdAt": Timestamp.fromDate(DateTime(2025, 1, 28, 9, 30)),
          "updatedAt": Timestamp.fromDate(DateTime(2025, 1, 28, 9, 30)),
        },
        {
          "groupTitle": "할 일",
          "title": "코드 리팩토링 계획 수립",
          "assignee": {
            "name": "박영희",
          },
          "content":
              "레거시 코드베이스의 기술 부채 해결을 위한 리팩토링 계획 수립. 단위 테스트 커버리지 향상, 디자인 패턴 적용, 코드 중복 제거 등의 작업 계획과 우선순위 설정.",
          "createdAt": Timestamp.fromDate(DateTime(2025, 1, 25, 11, 0)),
          "updatedAt": Timestamp.fromDate(DateTime(2025, 1, 27, 16, 45)),
        },
        {
          "groupTitle": "할 일",
          "title": "새로운 블로그 글 작성",
          "content":
              "다음 주에 발행할 블로그 글 주제를 정하고, 키워드 분석을 통해 SEO에 적합한 콘텐츠를 기획한 후 초안을 작성합니다. 또한 이미지나 그래프 등 시각 자료에 대한 아이디어를 포함시킬 예정입니다.",
          "createdAt": Timestamp.now(),
          "updatedAt": Timestamp.now(),
        },
        {
          "groupTitle": "할 일",
          "title": "3월 마케팅 캠페인 자료 준비",
          "assignee": {
            "name": "박영희",
          },
          "content":
              "3월에 진행할 마케팅 캠페인의 자료를 준비합니다. 캠페인 컨셉, 광고 문구, 타겟 고객층 분석 자료, 예상 효과 등을 포함하여 발표 자료를 제작합니다.",
          "createdAt": Timestamp.now(),
          "updatedAt": Timestamp.now(),
        }
      ],
    },
    {
      "groupTitle": "급한 일",
      "itemList": [
        {
          "groupTitle": "급한 일",
          "title": "프로덕션 서버 성능 이슈 해결",
          "assignee": {
            "name": "최민호",
          },
          "content":
              "프로덕션 환경에서 발생한 심각한 성능 저하 문제 해결. 데이터베이스 쿼리 최적화, 캐싱 전략 개선, 로그 분석을 통한 병목 지점 파악 및 즉각적인 조치 필요.",
          "createdAt": Timestamp.fromDate(DateTime(2025, 1, 29, 8, 15)),
          "updatedAt": Timestamp.fromDate(DateTime(2025, 1, 29, 8, 15)),
        },
        {
          "groupTitle": "급한 일",
          "title": "고객 지원 요청 긴급 처리",
          "assignee": {
            "name": "최민호",
          },
          "content":
              "VIP 고객의 시스템 사용 중 발생한 심각한 오류를 긴급히 해결합니다. 문제의 원인을 분석하고, 고객에게 즉시 해결 방안을 제공하며, 필요한 경우 관련 팀과 협력하여 신속히 대처합니다.",
          "createdAt": Timestamp.now(),
          "updatedAt": Timestamp.now(),
        }
      ],
    },
    {
      "groupTitle": "진행 중",
      "itemList": [
        {
          "groupTitle": "진행 중",
          "title": "쿠버네티스 클러스터 구축",
          "assignee": {
            "name": "이서연",
          },
          "content":
              "개발 및 스테이징 환경을 위한 쿠버네티스 클러스터 구축. CI/CD 파이프라인 통합, 모니터링 시스템 구성, 자동 스케일링 설정 등 포함.",
          "createdAt": Timestamp.fromDate(DateTime(2024, 12, 15, 13, 20)),
          "updatedAt": Timestamp.fromDate(DateTime(2025, 1, 28, 17, 30)),
        },
        {
          "groupTitle": "진행 중",
          "title": "GraphQL API 개발",
          "assignee": {
            "name": "김지훈",
          },
          "content":
              "기존 REST API를 GraphQL로 마이그레이션하는 작업 진행. 스키마 설계, 리졸버 구현, 데이터 로더 최적화, 클라이언트 쿼리 테스트 등 진행 중.",
          "createdAt": Timestamp.fromDate(DateTime(2024, 12, 20, 10, 0)),
          "updatedAt": Timestamp.fromDate(DateTime(2025, 1, 26, 15, 45)),
        },
        {
          "groupTitle": "진행 중",
          "title": "UI/UX 디자인 리서치",
          "assignee": {
            "name": "이서연",
          },
          "content":
              "새로운 프로젝트를 위해 최신 UI/UX 디자인 트렌드를 조사하고, 유사한 서비스를 분석하여 참고할 만한 디자인 사례를 정리합니다. 최종적으로 이를 바탕으로 와이어프레임을 제작할 예정입니다.",
          "createdAt": Timestamp.now(),
          "updatedAt": Timestamp.now(),
        },
        {
          "groupTitle": "진행 중",
          "title": "API 기능 기술 문서 작성",
          "assignee": {
            "name": "김지훈",
          },
          "content":
              "새로 개발된 API 기능에 대한 상세 기술 문서를 작성합니다. 문서에는 사용 방법, 요청/응답 형식, 예제 코드, 주의사항 등을 포함하며, 개발자들이 쉽게 이해할 수 있도록 작성합니다.",
          "createdAt": Timestamp.now(),
          "updatedAt": Timestamp.now(),
        }
      ],
    },
    {
      "groupTitle": "완료한 일",
      "itemList": [
        {
          "groupTitle": "완료한 일",
          "title": "보안 취약점 패치 적용",
          "assignee": {
            "name": "홍길동",
          },
          "content":
              "최근 발견된 Log4j 취약점 관련 전체 시스템 보안 패치 완료. 의존성 업데이트, 보안 설정 강화, 침투 테스트 수행 및 결과 보고서 작성 완료.",
          "createdAt": Timestamp.fromDate(DateTime(2024, 12, 10, 9, 0)),
          "updatedAt": Timestamp.fromDate(DateTime(2024, 12, 10, 9, 0)),
        },
        {
          "groupTitle": "완료한 일",
          "title": "신규 개발자 온보딩 문서 작성",
          "assignee": {
            "name": "이은지",
          },
          "content":
              "신규 입사 개발자를 위한 기술 스택 문서, 개발 환경 설정 가이드, 코딩 컨벤션, Git 워크플로우 등을 포함한 종합 온보딩 문서 작성 완료.",
          "createdAt": Timestamp.fromDate(DateTime(2024, 12, 5, 14, 0)),
          "updatedAt": Timestamp.fromDate(DateTime(2024, 12, 7, 16, 15)),
        },
        {
          "groupTitle": "완료한 일",
          "title": "주간 보고서 작성 및 제출",
          "assignee": {
            "name": "홍길동",
          },
          "content":
              "팀의 주간 성과와 진행 상황을 정리한 보고서를 작성하고, 각종 지표와 성과를 포함하여 경영진에게 제출했습니다. 주요 과제의 진행 상황과 다음 주 계획도 포함되어 있습니다.",
          "createdAt": Timestamp.now(),
          "updatedAt": Timestamp.now(),
        },
        {
          "groupTitle": "완료한 일",
          "title": "월간 목표 설정 회의 진행",
          "assignee": {
            "name": "이은지",
          },
          "content":
              "팀원들과 월간 목표를 설정하기 위한 회의를 진행했습니다. 회의에서는 현재 진행 중인 프로젝트 상황을 점검하고, 이번 달에 달성해야 할 주요 목표와 세부 계획을 논의했습니다.",
          "createdAt": Timestamp.now(),
          "updatedAt": Timestamp.now(),
        }
      ]
    },
  ];

  static List<Map<String, dynamic>> userList = [
    {
      "name": "박영희",
    },
    {
      "name": "최민호",
    },
    {
      "name": "이서연",
    },
    {
      "name": "김지훈",
    },
    {
      "name": "홍길동",
    },
    {
      "name": "이은지",
    },
  ];
}
