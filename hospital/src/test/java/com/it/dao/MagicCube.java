package com.it.dao;

import com.google.common.collect.Maps;
import org.junit.Test;

import java.util.Map;

/**
 * Created by xieyue on 2016/6/12.
 * MagicCube
 */
public class MagicCube {

    // U上面 D 下面 F 前面 B 后面 L 左面 R右面
    static int[][] UF = {{1, 1, 1}, {1, 1, 1}, {1, 1, 1}};
    static int[][] DF = {{6, 6, 6}, {6, 6, 6}, {6, 6, 6}};
    static int[][] FF = {{2, 2, 2}, {2, 2, 2}, {2, 2, 2}};
    static int[][] BF = {{4, 4, 4}, {4, 4, 4}, {4, 4, 4}};
    static int[][] LF = {{5, 5, 5}, {5, 5, 5}, {5, 5, 5}};
    static int[][] RF = {{3, 3, 3}, {3, 3, 3}, {3, 3, 3}};


    public static void main(String[] args) {


    }

    @Test
    public void test() {
        rotateBF();
        rerotateDF();
        rerotateLF();
        rerotateRF();
        rotateRF();
        rotateDF();
        rotateRF();
        rotateUF();
        rotateDF();
        for (int[] array : UF) {
            for (int num : array) {
                System.out.print(" \t" + num);
            }
            System.out.println("\r\n");
        }
    }


    //  顺时针旋转平面
    public void rotate(int[][] plan) {
        int temp1;
        temp1 = plan[0][0];
        plan[0][0] = plan[2][0];
        plan[2][0] = plan[2][2];
        plan[2][2] = plan[0][2];
        plan[0][2] = temp1;
        temp1 = plan[0][1];
        plan[0][1] = plan[1][0];
        plan[1][0] = plan[2][1];
        plan[2][1] = plan[1][2];
        plan[1][2] = temp1;
    }

    // 逆时针旋转平面
    public void rerotate(int[][] plan) {
        int temp2;
        temp2 = plan[0][0];
        plan[0][0] = plan[0][2];
        plan[0][2] = plan[2][2];
        plan[2][2] = plan[2][0];
        plan[2][0] = temp2;
        temp2 = plan[0][1];
        plan[0][1] = plan[1][2];
        plan[1][2] = plan[2][1];
        plan[2][1] = plan[1][0];
        plan[1][0] = temp2;
    }

    // 顺时针旋转顶面UF
    public void rotateUF() {
        rotate(UF);
        int[] temp = FF[0];
        FF[0] = RF[0];
        RF[0][0] = BF[2][2];
        RF[0][1] = BF[2][1];
        RF[0][2] = BF[2][0];
        BF[2][2] = LF[0][0];
        BF[2][1] = LF[0][1];
        BF[2][0] = LF[0][2];
        LF[0] = temp;
    }

    // 逆时针旋转顶面UF
    public void rerotateUF() {
        rerotate(UF);
        int[] temp = FF[0];
        FF[0] = LF[0];
        LF[0][0] = BF[2][2];
        LF[0][1] = BF[2][1];
        LF[0][2] = BF[2][0];
        BF[2][2] = RF[0][0];
        BF[2][1] = RF[0][1];
        BF[2][0] = RF[0][2];
        RF[0] = temp;
    }

    // 顺时针旋转前面FF
    public void rotateFF() {
        rotate(FF);
        int[] temp = DF[0];
        DF[0][0] = RF[2][0];
        DF[0][1] = RF[1][0];
        DF[0][2] = RF[0][0];
        RF[2][0] = UF[2][2];
        RF[1][0] = UF[2][1];
        RF[0][0] = UF[2][0];
        UF[2][2] = LF[0][2];
        UF[2][1] = LF[1][2];
        UF[2][0] = LF[2][2];
        LF[0][2] = temp[0];
        LF[1][2] = temp[1];
        LF[2][2] = temp[2];
    }

    // 逆时针旋转前面FF
    public void rerotateFF() {
        rerotate(FF);
        int[] temp = DF[0];
        DF[0][0] = LF[0][2];
        DF[0][1] = LF[1][2];
        DF[0][2] = LF[2][2];
        LF[0][2] = UF[2][2];
        LF[1][2] = UF[2][1];
        LF[2][2] = UF[2][0];
        UF[2][2] = RF[2][0];
        UF[2][1] = RF[1][0];
        UF[2][0] = RF[0][0];
        RF[2][0] = temp[0];
        RF[1][0] = temp[1];
        RF[0][0] = temp[2];
    }

    // 顺时针旋转右面RF
    public void rotateRF() {
        rotate(RF);
        int[] temp = new int[3];
        DF[0][2] = temp[0];
        DF[1][2] = temp[1];
        DF[2][2] = temp[2];
        DF[0][2] = BF[0][2];
        DF[1][2] = BF[1][2];
        DF[2][2] = BF[2][2];
        BF[0][2] = UF[0][2];
        BF[1][2] = UF[1][2];
        BF[2][2] = UF[2][2];
        UF[0][2] = FF[0][2];
        UF[1][2] = FF[1][2];
        UF[2][2] = FF[2][2];
        FF[0][2] = temp[0];
        FF[1][2] = temp[1];
        FF[2][2] = temp[2];
    }

    // 逆时针旋转右面RF
    public void rerotateRF() {
        rerotate(RF);
        int[] temp = new int[3];
        DF[0][2] = temp[0];
        DF[1][2] = temp[1];
        DF[2][2] = temp[2];
        DF[0][2] = FF[0][2];
        DF[1][2] = FF[1][2];
        DF[2][2] = FF[2][2];
        FF[0][2] = UF[0][2];
        FF[1][2] = UF[1][2];
        FF[2][2] = UF[2][2];
        UF[0][2] = BF[0][2];
        UF[1][2] = BF[1][2];
        UF[2][2] = BF[2][2];
        BF[0][2] = temp[0];
        BF[1][2] = temp[1];
        BF[2][2] = temp[2];
    }

    // 顺时针旋转背面BF
    public void rotateBF() {
        rotate(BF);
        int[] temp = UF[0];
        UF[0][0] = RF[0][2];
        UF[0][1] = RF[1][2];
        UF[0][2] = RF[2][2];
        RF[0][2] = DF[2][2];
        RF[1][2] = DF[2][1];
        RF[2][2] = DF[2][0];
        DF[2][2] = LF[2][0];
        DF[2][1] = LF[1][0];
        DF[2][0] = LF[0][0];
        LF[2][0] = temp[0];
        LF[1][0] = temp[1];
        LF[0][0] = temp[2];


    }

    // 逆时针旋转背面BF
    public void rerotateBF() {
        rerotate(BF);
        int[] temp = UF[0];
        UF[0][0] = LF[2][0];
        UF[0][1] = LF[1][0];
        UF[0][2] = LF[0][0];
        LF[2][0] = DF[2][2];
        LF[1][0] = DF[2][1];
        LF[0][0] = DF[2][0];
        DF[2][2] = RF[0][2];
        DF[2][1] = RF[1][2];
        DF[2][0] = RF[2][2];
        RF[0][2] = temp[0];
        RF[1][2] = temp[1];
        RF[2][2] = temp[2];
    }

    // 顺时针旋转左面LF
    public void rotateLF() {
        rotate(LF);
        int[] temp = new int[3];
        DF[2][0] = temp[0];
        DF[1][0] = temp[1];
        DF[0][0] = temp[2];
        DF[2][0] = FF[2][0];
        DF[1][0] = FF[1][0];
        DF[0][0] = FF[0][0];
        FF[2][0] = UF[2][0];
        FF[1][0] = UF[1][0];
        FF[0][0] = UF[0][0];
        UF[2][0] = BF[2][0];
        UF[1][0] = BF[1][0];
        UF[0][0] = BF[0][0];
        BF[2][0] = temp[0];
        BF[1][0] = temp[1];
        BF[0][0] = temp[2];

    }

    // 逆时针旋转左面LF
    public void rerotateLF() {
        rerotate(LF);
        int[] temp = new int[3];
        DF[2][0] = temp[0];
        DF[1][0] = temp[1];
        DF[0][0] = temp[2];
        DF[2][0] = BF[2][0];
        DF[1][0] = BF[1][0];
        DF[0][0] = BF[0][0];
        BF[2][0] = UF[2][0];
        BF[1][0] = UF[1][0];
        BF[0][0] = UF[0][0];
        UF[2][0] = FF[2][0];
        UF[1][0] = FF[1][0];
        UF[0][0] = FF[0][0];
        FF[2][0] = temp[0];
        FF[1][0] = temp[1];
        FF[0][0] = temp[2];
    }

    /**
     * 顺时针旋转底面DF
     */
    public void rotateDF() {
        rotate(DF);
        int[] temp = BF[0];
        BF[0][0] = RF[2][2];
        BF[0][1] = RF[2][1];
        BF[0][2] = RF[2][0];
        RF[2][2] = FF[2][2];
        RF[2][1] = FF[2][1];
        RF[2][0] = FF[2][0];
        FF[2][2] = LF[2][2];
        FF[2][1] = LF[2][1];
        FF[2][0] = LF[2][0];
        LF[2][2] = temp[0];
        LF[2][1] = temp[1];
        LF[2][0] = temp[2];
    }

    /**
     * 逆时针旋转底面DF
     */
    public void rerotateDF() {
        rerotate(DF);
        int[] temp = BF[0];
        BF[0][0] = LF[2][2];
        BF[0][1] = LF[2][1];
        BF[0][2] = LF[2][0];
        LF[2][2] = FF[2][2];
        LF[2][1] = FF[2][1];
        LF[2][0] = FF[2][0];
        FF[2][2] = RF[2][2];
        FF[2][1] = RF[2][1];
        FF[2][0] = RF[2][0];
        RF[2][2] = temp[0];
        RF[2][1] = temp[1];
        RF[2][0] = temp[2];
    }

    /**
     *
     */
    public String getEdge() {


        Map<String, String> edge = Maps.newHashMap();

        edge.put("UF", UF[2][1] + "" + FF[0][1]);
        edge.put("UR", UF[1][2] + "" + RF[0][1]);
        edge.put("UB", UF[0][1] + "" + BF[2][1]);
        edge.put("UL", UF[1][0] + "" + LF[0][1]);

        edge.put("LF", LF[1][2] + "" + FF[1][0]);
        edge.put("FR", FF[1][2] + "" + RF[1][0]);
        edge.put("RB", RF[1][2] + "" + BF[1][2]);
        edge.put("BL", BF[1][0] + "" + LF[1][0]);

        edge.put("DB", DF[2][1] + "" + BF[0][1]);
        edge.put("DR", DF[1][2] + "" + RF[2][1]);
        edge.put("DL", DF[1][0] + "" + LF[2][1]);
        edge.put("DF", DF[0][1] + "" + FF[2][1]);


        Map<String, String> core = Maps.newHashMap();

        core.put("UFR", UF[2][2] + "" + FF[0][2] + "" + RF[0][0]);
        core.put("URB", UF[0][2] + "" + RF[0][2] + "" + BF[2][2]);
        core.put("UBL", UF[0][0] + "" + BF[2][0] + "" + LF[0][0]);
        core.put("ULF", UF[2][0] + "" + LF[0][2] + "" + FF[0][0]);

        core.put("DBR", DF[2][2] + "" + BF[0][2] + "" + RF[2][2]);
        core.put("DRF", DF[0][2] + "" + RF[2][0] + "" + FF[2][2]);
        core.put("DFL", DF[0][0] + "" + FF[2][0] + "" + LF[2][2]);
        core.put("DLB", DF[2][0] + "" + LF[2][0] + "" + BF[0][0]);


        return "";
    }


}
