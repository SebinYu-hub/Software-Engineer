# 주니어 개발자 이력서

## 웨이팅 서비스 구축 프로젝트
**기술 스택**: Kotlin, Spring Webflux, Redis, Docker, Swagger UI

**주요 성과**:
- 헥사고날 아키텍처 도입을 통한 관심사 분리 및 유지보수성 향상
  - Domain, Application, Infrastructure 레이어 분리로 비즈니스 로직 순수성 확보
  - Use Case 중심의 인터페이스 설계로 요구사항 변경 대응력 강화

- 분산 시스템 최적화
  - Redis를 활용한 휘발성 데이터(웨이팅 상태) 관리로 시스템 부하 감소
  - 메모리 기반 데이터 처리로 응답 속도 70% 개선

## QR 기반 매장 관리 시스템
**기술 스택**: Java, Spring Boot, JPA, MySQL, AWS (S3, EKS), OpenSearch

**주요 성과**:
- 데이터 무결성 및 성능 최적화
  - B+Tree 인덱스 전략 수립으로 조회 성능 300% 향상
  - @Transactional 어노테이션 활용한 ACID 준수 트랜잭션 관리

- 네트워크 최적화
  - 응답 DTO 최적화로 불필요한 데이터 전송량 40% 감소
  - EKS와 Argo CD를 활용한 무중단 배포 파이프라인 구축

## 매출 데이터 마이그레이션 프로젝트
**기술 스택**: MySQL, Snowflake, AWS DMS, Apache Airflow

**주요 성과**:
- 대규모 데이터 마이그레이션 아키텍처 설계
  - CDC(Change Data Capture) 기반 실시간 데이터 동기화 구현
  - AWS DMS를 활용한 안정적인 데이터 파이프라인 구축

- 데이터 품질 관리 체계 수립
  - AWS Pre-migration Assessment 도구 도입으로 데이터 정합성 검증 자동화
  - Snowflake 스토리지 계층 최적화로 쿼리 성능 200% 개선

## 인증/인가 시스템 통합
**기술 스택**: Kubernetes, OAuth 2.0, OpenID Connect

**주요 성과**:
- Single Sign-On(SSO) 구현
  - 5개 도메인 통합 인증체계 구축으로 보안 취약점 제거
  - Role-Based Access Control(RBAC) 도입으로 리소스 접근 제어 강화

## 배치 시스템 현대화 프로젝트 (Spring Batch → Airflow)
**기술 스택**: Apache Airflow, Python, Spring Batch

**주요 성과**:
- 배치 아키텍처 현대화
  - 레이어드 아키텍처 도입으로 비즈니스 로직과 인프라 코드 분리
  - 옵저버 패턴 적용으로 작업 상태 모니터링 개선
  - DAG(Directed Acyclic Graph) 기반 워크플로우 최적화

- 테스트 자동화 체계 구축
  - Unit Test 커버리지 80% 달성
  - Airflow DAG 검증 파이프라인 구축으로 배포 전 오류 조기 발견

## 매출 통계 자동화 시스템
**기술 스택**: Snowflake, Python, Google Drive API

**주요 성과**:
- 쿼리 최적화
  - 서브쿼리 모듈화로 재사용성 향상 및 유지보수성 개선
  - CTE(Common Table Expression) 활용으로 복잡한 쿼리 가독성 향상

- 자동화 프로세스 구축
  - ETL 파이프라인 자동화로 수동 작업 시간 90% 감소
  - Google Drive API 연동으로 데이터 공유 프로세스 자동화

## 기술적 특징 종합
1. **분산 시스템 설계**
   - Redis, Snowflake 활용한 확장 가능한 아키텍처 구현
   - 마이크로서비스 간 데이터 일관성 보장

2. **데이터 엔지니어링**
   - CDC 기반 실시간 데이터 동기화
   - ETL 파이프라인 최적화 및 자동화

3. **시스템 보안**
   - OAuth 2.0 기반 통합 인증 체계
   - RBAC를 통한 세분화된 접근 제어

4. **DevOps 프랙티스**
   - EKS/Argo CD 기반 CI/CD 파이프라인
   - 모니터링 및 로깅 체계 구축