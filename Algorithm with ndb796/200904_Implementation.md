완전탐색, 시뮬레이션, 등 생각을 구현해 내야하는 문제들.

## 예제) 상하좌우

### 코드

```java
public class 상하좌우 {

	public static void main(String[] args) throws Exception {
		char[] map = {'R','R','R','U','D','D'};
		int n = 5;
		int[] answer = solution(map, n);
		System.out.println(answer[0] +" "+ answer[1]);
	}

	public static int[] solution(char[] map, int n) {
		int[] answer = {1, 1};
		int i=0;
		while(i<map.length) {
			switch(map[i]){
				case 'L' :
					answer[1] -= answer[1]==1?0:1;
					break;
				case 'R' :
					answer[1] += answer[1]==n?0:1;
					break;
				case 'U' :
					answer[0] -= answer[0]==1?0:1;
					break;
				case 'D' :
					answer[0] += answer[0]==n?0:1;
					break;
				default:
					break;
			}
			i++;
		}// end while
		return answer;
	}
}
```

## 예제) 시각

### 코드

```java
public class 시각 {

	public static void main(String[] args) throws Exception {
		int n = 5;
		int answer = solution(n);
		System.out.println(answer);
	}

	public static int solution(int n) {
		int answer =0;
		for(int i=0; i<n+1; i++) {
			if(i%10==3) {
				answer += 3600;
			}else {
				answer +=1575;
			}
		}
		return answer;
	}
	
}
```

## 실전) 왕실의 나이트

### 코드

```java
public class 왕실나이트 {
	
	public static void main(String[] args) throws Exception {
		String str = "c2";
		int answer = solution(str);
		System.out.println(answer);
	}

	public static int solution(String str) {
		int answer = 0;
		int x = str.charAt(0)-'a'+1;
		int y = str.charAt(1)-'0';
		
		// 나이트가 이동할 수 있는 8가지 방향 정의
        int[] dx = {-2, -1, 1, 2, 2, 1, -1, -2};
        int[] dy = {-1, -2, -2, -1, 1, 2, 2, 1};
        
        for (int i = 0; i < 8; i++) {
            // 이동하고자 하는 위치 확인
            int nextRow = x + dx[i];
            int nextColumn = y + dy[i];
            // 해당 위치로 이동이 가능하다면 카운트 증가
            if (nextRow >0 && nextRow < 9 && nextColumn > 0 && nextColumn < 9) {
            	answer ++;
            }
        }
		
		return answer;
	}
}
```

## 실전) 게임 개발

### 코드

map의 x와 y를 반대로 씀.

```java
public class 게임개발 {
	public static int n, m, x, y, direction;

	public static void main(String[] args) throws Exception {
		Scanner sc = new Scanner(System.in);
		// N, M을 공백을 기준으로 구분하여 입력받기
		n = sc.nextInt();
		m = sc.nextInt();

		// 현재 캐릭터의 X 좌표, Y 좌표, 방향을 입력받기
		x = sc.nextInt();
		y = sc.nextInt();
		direction = sc.nextInt();
		int[][] map = new int[n][m];
		// 전체 맵 정보를 입력 받기
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < m; j++) {
				map[i][j] = sc.nextInt();
			}
		}
		int answer = solution(map);
		System.out.println(answer);
	}

	public static int solution(int[][] map) {
		int answer = 1;
		map[x][y]=2;
		int end =1;
		while (end<5) {
			switch (direction) {
			case 0:
				if(map[x-1][y]==0) {
					map[x-1][y]=2;
					x-=1;
					answer++;
					end = 0;
				}
				end++;
				turn_left();
				break;
			case 1:
				if(map[x][y+1]==0) {
					map[x][y+1]=2;
					y+=1;
					answer++;
					end = 0;
				}
				end++;
				turn_left();
				break;
			case 2:
				if(map[x+1][y]==0) {
					map[x+1][y]=2;
					x+=1;
					answer++;
					end = 0;
				}
				end++;
				turn_left();
				break;
			case 3:
				if(map[x][y-1]==0) {
					map[x][y-1]=2;
					y-=1;
					answer++;
					end = 0;
				}
				end++;
				turn_left();
				break;
			}
			if(end==5) {
				int tmp = direction>1?direction-2:direction+2;
				switch(tmp) {
				case 0:
					if(map[x+1][y]==2) {
						x+=1;
						end = 1;
					}
					break;
				case 1:
					if(map[x][y+1]==2) {
						y+=1;
						end = 1;
					}
					break;
				case 2:
					if(map[x-1][y]==2) {
						x-=1;
						end = 1;
					}
					break;
				case 3:
					if(map[x][y-1]==2) {
						y-=1;
						end = 1;
					}
					break;
				}
			}
		}
		return answer;
	}

	// 왼쪽으로 회전
	public static void turn_left() {
		direction -= direction == 0 ? -3 : 1;
	}

}
```

## Q7 럭키 스트레이트

https://www.acmicpc.net/problem/18406

### 코드

```java
public class 럭키스트레이트 {
	public static void main(String[] args) throws Exception {
		Scanner sc = new Scanner(System.in);
		String str = sc.next();
		sc.close();
		
		char[] ch = str.toCharArray();
		int len = str.length()/2;
		int left =0;
		int right =0;
		for(int i=0; i<len; i++) {
			left += ch[i];
			right += ch[len+i];
		}
		str = left==right?"LUCKY":"READY";
		System.out.print(str);
	}
}
```

## Q8 럭키 스트레이트

### 코드

```java
import java.util.Arrays;
import java.util.Scanner;

public class 문자열재정렬 {
	public static void main(String[] args) throws Exception {
		Scanner sc = new Scanner(System.in);
		String str = sc.next();
		sc.close();
		
		char[] ch = str.toCharArray();
		Arrays.sort(ch);
		int num =0;
		StringBuilder sb = new StringBuilder();
		for(int i=0; i<str.length();i++) {
			if(ch[i]-'0'<10) {
				num += ch[i]-'0';
			}else {
				sb.append(ch[i]);
			}
		}
		System.out.print(sb.toString()+num);
	}
}
```

## Q9 문자열 압축

https://programmers.co.kr/learn/courses/30/lessons/60057

### 풀이

완전탐색

### 코드

```java
public class 문자열재정렬 {
	public static void main(String[] args) throws Exception {
		Scanner sc = new Scanner(System.in);
		String s = sc.next();
		sc.close();
		
		int answer = s.length();

		StringBuilder result;
		StringBuilder sub;
		int len = s.length();
		
		for(int subSize =1; subSize <= len/2; subSize++) {
			result = new StringBuilder();
			int count =1;
			String pre = s.substring(0, subSize);
			for(int j=subSize; j<len; j+=subSize) {
				sub = new StringBuilder();
				for(int z = j; z<j+subSize;z++) {
					if(z<len)sub.append(s.charAt(z));
				}
				if(pre.equalsIgnoreCase(sub.toString())) {
					count++;
				}else {
					result.append(count>1?count+pre:pre);
					count =1;
					pre = sub.toString();
				}
			}
			//남은 문자열 처리
			result.append(count>1?count+pre:pre);
			answer = Math.min(answer, result.length());
		}
		System.out.println(answer);
	}
}
```

## Q10 자물쇠와 열쇠

https://programmers.co.kr/learn/courses/30/lessons/60057

### 풀이

2차원 배열의 최대 사이즈가 400임으로 완전탐색 가능!

접근 인덱스를 편리하게 하기 위해  lock배열의 크기를 3배로 늘림.

모든 경우를 비교후 답을 찾지 못하면 false 단, 중간에 해결되면 return true;

### 코드

```java
public class 자물쇠와열쇠 {

	public static void main(String[] args) throws Exception {
		int[][] lock = { { 1, 1, 1 }, { 1, 1, 0 }, { 1, 0, 1 } };
		int[][] key = { { 0,0,0 }, { 1,0,0 }, { 0, 1, 1 } };

		System.out.println(solution(key, lock));
	}

	public static boolean solution(int[][] key, int[][] lock) {
		int m = key.length;
		int n = lock.length;
		int[][] newLock = new int[n * 3][n * 3]; // 모든 값이 0인 새로운 배열
		for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                newLock[i + n][j + n] = lock[i][j];
            }
        }

		for(int rota=0;rota<4;rota++) {
			// lock배열을 전부 탐색하는 for문
			for (int row = 0; row < n * 2; row++) {
				for (int column = 0; column < n * 2; column++) {
					// 열쇠 넣기
					for (int x = 0; x < m; x++) {
						for (int y = 0; y < m; y++) {
							newLock[row + x][column + y] += key[x][y];
						}
					}
					// 확인
					if (check(newLock))
						return true;
					// 열쇠 빼기
					for (int x = 0; x < m; x++) {
						for (int y = 0; y < m; y++) {
							newLock[row + x][column + y] -= key[x][y];
						}
					}
				}
			}
			key=turn_key(key);
		} // end for 4번 반복 후 불가능하면 false;
		return false;
	}

	public static boolean check(int[][] newLock) {
		int lockLen = newLock.length / 3;
		for (int i = lockLen; i < lockLen * 2; i++) {
			for (int j = lockLen; j < lockLen * 2; j++) {
				if (newLock[i][j] != 1) {
					return false;
				}
			}
		}
		return true;
	}

	public static int[][] turn_key(int[][] key) {
		int m = key.length;
		int[][] turn = new int[m][m];
		for (int i = 0; i < m; i++) {
			for (int j = 0; j < m; j++) {
				turn[j][m-i-1] = key[i][j];
			}
		}
		return turn;
	}
}
```

### 회고

실수 turn함수에서 turn배열의 선언(int[][] turn = key;)로해 call by reference의 효과로 덥어쓰기가 됨. 주의!!

## Q11 뱀

https://www.acmicpc.net/problem/3190

### 풀이

2차원 배열의 최대 사이즈가 400임으로 완전탐색 가능!

### 코드

```java
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;
import java.util.StringTokenizer;

class SnakeTail {

	private int index_x;
	private int index_y;

	public SnakeTail(int index_x, int index_y) {
		this.index_x = index_x;
		this.index_y = index_y;
	}

	public int getx() {
		return this.index_x;
	}

	public int gety() {
		return this.index_y;
	}
}

public class 뱀 {

	public static int n, x, y, direction, result;
	public static Queue<SnakeTail> snake;
	public static boolean check;
	public static int[][] map;

	public static void main(String[] args) throws Exception {
		Scanner sc = new Scanner(System.in);
		int k, l, tmpx, tmpy;
		n = sc.nextInt();
		k = sc.nextInt();

		map = new int[n][n];
		// 사과 정보를 입력 받기
		for (int i = 0; i < k; i++) {
			tmpx = sc.nextInt();
			tmpy = sc.nextInt();
			map[tmpx - 1][tmpy - 1] = 1;
		}
		l = sc.nextInt();
		direction = 0;
		result = 0;
		x = 0;
		y = 0;
		snake = new LinkedList<SnakeTail>();
		check = true;
		sc.nextLine();// 버퍼의 남은 것.flash
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < l; i++) {
			sb.append(sc.nextLine().trim() + " ");
		}
		sb.append(100 + " D");
		
		// 게임시작
		snake.add(new SnakeTail(x, y));
		map[x][y] = -1;
		StringTokenizer st = new StringTokenizer(sb.toString(), " ");
		int pre = 0;
		while (true) {
			int tmp = Integer.parseInt(st.nextToken());
			if (solution(tmp - pre, st.nextToken().charAt(0))) {
				System.out.print(result);
				break;
			}
			pre = tmp;
		}
		sc.close();
	}

	private static boolean solution(int sec, char c) {
		switch (direction) {
		case 0:
			for (int i = 0; i < sec; i++) {
				result++;
				if (y + 1 < n) {// end_check
					if (map[x][y + 1] < 0) {// end_check_2
						return true;
					} else if (map[x][y + 1] == 1) {// apple_check
						check = false;
					}
					move(0, 1);
				} else {
					return true;
				}
			}
			break;
		case 1:
			for (int i = 0; i < sec; i++) {
				result++;
				if (x + 1 < n) {// end_check
					if (map[x + 1][y] < 0) {// end_check_2
						return true;
					} else if (map[x + 1][y] == 1) {// apple_check
						check = false;
					}
					move(1, 0);
				} else {
					return true;
				}
			}
			break;
		case 2:
			for (int i = 0; i < sec; i++) {
				result++;
				if (y - 1 > -1) {// end_check
					if (map[x][y - 1] < 0) {// end_check_2
						return true;
					} else if (map[x][y - 1] == 1) {// apple_check
						check = false;
					}
					move(0, -1);
				} else {
					return true;
				}
			}
			break;
		case 3:
			for (int i = 0; i < sec; i++) {
				result++;
				if (x - 1 > -1) {// end_check
					if (map[x - 1][y] < 0) {// end_check_2
						return true;
					} else if (map[x - 1][y] == 1) {// apple_check
						check = false;
					}
					move(-1, 0);
				} else {
					return true;
				}
			}
			break;
		}
		/*
		 * 0 동, 1남, 2서, 3북
		 */
		if (c - 'D' == 0)
			direction += direction == 3 ? 0 : 1;
		else
			direction -= direction == 0 ? -3 : 1;
		return false;
	}

	private static void move(int i, int j) {
		x += i;
		y += j;
		snake.add(new SnakeTail(x, y));
		map[x][y] = -1;
		if (check) {
			SnakeTail tmp = (SnakeTail) snake.poll();
			map[tmp.getx()][tmp.gety()] = 0;
		}
		check = true;

	}
}
```

### 회고

불가능한 예제가 있다.

## Q12기둥과 보 설치

### 풀이

무작정 추가하고 가능성을 확인 하는 것을 반복 (삭제또한 같음)

### 코드

```java
package algorithm_ndb796;

import java.util.ArrayList;
import java.util.Collections;

class Builder implements Comparable<Builder> {

	private int x, y, type;

	public Builder(int x, int y, int type) {
		this.x = x;
		this.y = y;
		this.type = type;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public int compareTo(Builder b) {
		if (this.getX() - b.getX() != 0) {
			return this.getX() - b.getX();
		}
		if (this.getY() - b.getY() != 0) {
			return this.getY() - b.getY();
		}
		return this.getType() - b.getType();

	}
}

public class 기둥과보설치2 {
	public static ArrayList<Builder> map;
	public static void main(String[] args) throws Exception {
		int n = 5;
		int[][] build_frame = {{0,0,0,1},{2,0,0,1},{4,0,0,1},{0,1,1,1},{1,1,1,1},{2,1,1,1},{3,1,1,1},{2,0,0,0},{1,1,1,0},{2,2,0,1}};
		int[][] result = solution(n, build_frame);
		for(int i=0; i<map.size();i++) {
			for(int j=0; j<3; j++)
				System.out.print(result[i][j] + ", ");
			System.out.println();
		}
		;			
	}

	public static int[][] solution(int n, int[][] build_frame) {
		
		map = new ArrayList<Builder>();
		int x, y;
		for (int step = 0; step < build_frame.length; step++) {
			x = build_frame[step][0];
			y = build_frame[step][1];
			Builder tmp =new Builder(x, y, build_frame[step][2]);
			if (build_frame[step][3] == 1) {// 설치
				map.add(tmp);
				if (!isPossible(map))
					map.remove(tmp);
			} else {// 삭제
				map.remove(indexBuilderByFild(map,x, y, build_frame[step][2]));
				if (!isPossible(map))
					map.add(tmp);
			}
		} // build_frame순회
		// map sort
		Collections.sort(map);
		// map 2'array로 변환
		int[][] answer = new int[map.size()][3];
		for(int i=0; i<map.size(); i++) {
			Builder tmp = map.get(i);
			answer[i][0] = tmp.getX();
			answer[i][1] = tmp.getY();
			answer[i][2] = tmp.getType();
		}
		return answer;
	}

	private static boolean isPossible(ArrayList<Builder> b) {
		for (Builder bb : b) {
			if (bb.getType() == 0) {// 기둥
				// '바닥 위' 혹은 '보의 한쪽 끝 부분 위' 혹은 '다른 기둥 위'라면 정상
				if (bb.getY() == 0 || b.contains(new Builder(bb.getX(), bb.getY(), 1))
						|| queryBuilderByFild(b,bb.getX()-1, bb.getY() , 1)
						|| queryBuilderByFild(b,bb.getX(), bb.getY() , 1)
						|| queryBuilderByFild(b,bb.getX(), bb.getY() - 1, 0))
					continue;
				return false;
			} else {// 보
					// '한쪽 끝부분이 기둥 위' 혹은 '양쪽 끝부분이 다른 보와 동시에 연결'이라면 정상
				if (queryBuilderByFild(b,bb.getX()+1, bb.getY()-1, 0)
						||queryBuilderByFild(b,bb.getX(), bb.getY()-1, 0)
						|| (queryBuilderByFild(b,bb.getX()-1, bb.getY() , 1)
								&& queryBuilderByFild(b,bb.getX()+1, bb.getY(), 1)))
					continue;
				return false;
			}
		}
		return true;
	}
	private static boolean queryBuilderByFild(ArrayList<Builder> b, int x, int y, int t) {
		for (Builder bb : b) {
			if (bb.getX() == x && bb.getY() == y && bb.getType()==t) {
				return true;
			}
		}
		return false;
	}
	private static int indexBuilderByFild(ArrayList<Builder> b, int x, int y, int t) {
		int cnt=0;
		for (Builder bb : b) {
			if (bb.getX() == x && bb.getY() == y && bb.getType()==t) {
				return cnt;
			}
			cnt++;
		}
		return -1;
	}

}
```

### 회고

ArrayLsit검색을 위해 hashcode와 equals를 override하면 편하게 같은 객체를 찾을수 있다.