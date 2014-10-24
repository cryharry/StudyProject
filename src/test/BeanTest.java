/*
 * BeanTest.java 2014. 10. 24.
 *
 * Copyright oracleclub.com All rights Reserved.
 */
package test;

public class BeanTest {
    // 멤버변수
    private String name; // 데이터은닉 캡슐화

    // 생성자
    // 메서드()

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     *            the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
}
