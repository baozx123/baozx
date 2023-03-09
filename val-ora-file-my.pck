CREATE OR REPLACE PACKAGE PKG_VALT as
  procedure proc_inlz_valtmodl_parm(vValtId in varchar2, -- 估值ID
                                    vValtDt in varchar2, --估值日期（yyyyMMdd格式）
                                    vIdyTp  in varchar2, --行业类别
                                    vCstId  in varchar2, -- 客户编号
                                    vOprId  in varchar2, -- 操作员编号
                                    oi_flag out pls_integer, -- 1  成功  0 错误
                                    os_msg  out varchar2 -- 出错信息
                                    );

  procedure proc_clc_valtmodl_idx(vValtId in varchar2, -- 估值ID
                                  vValtDt in varchar2, --估值日期（yyyyMMdd格式）
                                  vIdyTp  in varchar2, --行业类别
                                  vCstId  in varchar2, -- 客户编号
                                  vOprId  in varchar2, -- 操作员编号
                                  oi_flag out pls_integer, -- 1  成功  0 错误
                                  os_msg  out varchar2 -- 出错信息
                                  );

  procedure proc_clc_assets_idx(vValtId       in varchar2, -- 估值ID
                                vParaDt       in varchar2, --估值日期（yyyyMMdd格式）
                                vIdyTpSupr    in varchar2, -- 行业类别
                                vCstId        in varchar2, -- 客户编号
                                vOprId        in varchar2, -- 操作员编号
                                vHisStartYear in number, -- 历史数据始于(年) 如：2016
                                vHisEndYear   in number, -- 历史数据止于(年) 如：2018
                                vPreStartYear in number, -- 预测数据始于(年) 如：2019
                                vPreNum       in number, -- 预测年数 如：3
                                vIdxTpcd      in varchar2, --指标类型编码（多个时以逗号隔开）
                                oi_flag       out pls_integer, -- 1  成功  0 错误
                                os_msg        out varchar2 -- 出错信息
                                );

  procedure proc_init_cfg_dtl(vArgTp rule_inlz_cfg_dtl.idx_clc_arg_tp%TYPE);

  procedure proc_idx_sort(vValtId in varchar2, -- 估值ID
                          oi_flag out pls_integer, -- 1  成功  0 错误
                          os_msg  out varchar2 -- 出错信息
                          );

  procedure proc_inlz_common_date(vValtId       in varchar2, -- 估值ID
                                  vIdyTp        in varchar2, -- 行业类别
                                  vValtDt       in varchar2, -- 估值日期
                                  vParaDt       out varchar2, -- 估值日期
                                  vHisStartYear out number, --历史数据始于(年),如2016
                                  vHisEndYear   out number, --历史数据止于(年)，如2018
                                  vLstDt        out date, --历史截止年，如to_date('20181231','yyyyMMdd')
                                  vPreStartYear out number, --预测数据始于(年)，如2019
                                  vPreNum       out number, --预测年数，如3
                                  vIdyTpSupr    out varchar2,
                                  oi_flag       out pls_integer, -- 1  成功  0 错误
                                  os_msg        out varchar2 -- 出错信息
                                  );

  procedure proc_inlz_fnc_idx_val(vValtId    in varchar2, -- 估值ID
                                  vValtDt    in varchar2, --估值日期（yyyyMMdd格式）
                                  vParaDt    in varchar2, --估值日期（yyyyMMdd格式）
                                  vLstDt     in Date, -- 历史最近一期
                                  vIdyTpSupr in varchar2, -- 行业类别
                                  vCstId     in varchar2, -- 客户编号
                                  vOprId     in varchar2, -- 操作员编号
                                  oi_flag    out pls_integer, -- 1  成功  0 错误
                                  os_msg     out varchar2 -- 出错信息
                                  );

  procedure proc_clc_idx(vValtId       in varchar2, -- 估值ID
                         vParaDt       in varchar2, --估值日期（yyyyMMdd格式）
                         vIdyTpSupr    in varchar2, -- 行业类别
                         vCstId        in varchar2, -- 客户编号
                         vOprId        in varchar2, -- 操作员编号
                         vHisStartYear in number, -- 历史数据始于(年) 如：2016
                         vHisEndYear   in number, -- 历史数据止于(年) 如：2018
                         vPreStartYear in number, -- 预测数据始于(年) 如：2019
                         vPreNum       in number, -- 预测年数 如：3
                         vIdxTpcd      in varchar2, --指标类型编码（多个时以逗号隔开）
                         oi_flag       out pls_integer, -- 1  成功  0 错误
                         os_msg        out varchar2 -- 出错信息
                         );

  procedure proc_valt_common_indexcal(vValtId       in varchar2, -- 估值ID
                                      vParaDt       in varchar2, --估值日期（yyyyMMdd格式）
                                      vIdyTpSupr    in varchar2, -- 行业类别
                                      vCstId        in varchar2, -- 客户编号
                                      vOprId        in varchar2, -- 操作员编号
                                      vHisStartYear in number, -- 历史数据始于(年) 如：2016
                                      vHisEndYear   in number, -- 历史数据止于(年) 如：2018
                                      vPreStartYear in number, -- 预测数据始于(年) 如：2019
                                      vPreNum       in number, -- 预测年数 如：3
                                      vIdxTpcd      in varchar2, --指标类型编码（多个时以逗号隔开）
                                      vScmRcmm      in varchar2, --推荐方案编码，默认为X公用方案
                                      oi_flag       out pls_integer, -- 1  成功  0 错误
                                      os_msg        out varchar2 -- 出错信息
                                      );

  procedure proc_valt_clc(vValtId  in varchar2, -- 估值ID
                          vIdxTpcd in varchar2, -- 指标类型编码
                          vCstId   in varchar2, -- 客户编号
                          vOprId   in varchar2, -- 操作员编号
                          oi_flag  out pls_integer, -- 1  成功  0 错误
                          os_msg   out varchar2 -- 出错信息
                          );

  procedure proc_inlz_mnt_idx(vValtId in varchar2, -- 估值ID
                              vLstDt  in Date, -- 历史最近一期
                              vIdyTp  in varchar2, --行业类别
                              vCstId  in varchar2, -- 客户编号
                              vOprId  in varchar2, -- 操作员编号
                              oi_flag out pls_integer, -- 1  成功  0 错误
                              os_msg  out varchar2 -- 出错信息
                              );

  procedure proc_adj_mnt_idx(vValtId       in varchar2, -- 估值ID
                             vParaDt       in varchar2, -- 估值日期（yyyyMMdd格式）
                             vLstDt        in Date, -- 历史最近一期
                             vHisStartYear in number, -- 历史数据始于(年) 如：2016
                             vHisEndYear   in number, -- 历史数据止于(年) 如：2018
                             vPreStartYear in number, -- 预测数据始于(年) 如：2019
                             vIdyTpSupr    in varchar2, -- 行业类别
                             vCstId        in varchar2, -- 客户编号
                             vOprId        in varchar2, -- 操作员编号
                             oi_flag       out pls_integer, -- 1  成功  0 错误
                             os_msg        out varchar2 -- 出错信息
                             );

  procedure proc_mnt_aflt_idx_val(vValtId in varchar2, -- 估值ID
                                  vCstId  in varchar2, -- 客户编号
                                  vOprId  in varchar2, -- 操作员编号
                                  oi_flag out pls_integer, -- 1  成功  0 错误
                                  os_msg  out varchar2 -- 出错信息
                                  );

  procedure proc_clc_log(vValtId in varchar2, -- 估值ID
                         procNm  in varchar2, --当前调用的程序名
                         logInf  in varchar2, --日志信息
                         logLvl  in varchar2 --日志级别：ERROR、WARN、INFO
                         );

  procedure proc_valt_rcrd(vValtId   in varchar2, -- 估值ID
                           procNm    in varchar2, -- 当前调用的接口
                           wthrCompl in varchar2 -- 开始0，结束1
                           );

  procedure proc_frct_ratnl_tst(vValtId in varchar2 -- 估值ID
                                );

  FUNCTION f_get_idx_val(vValtId      SBJ_AND_IDX_CLC_RSLT.VALT_ID%TYPE, -- 估值ID
                         vIdxClcId    IDX_CLC.Idx_Clcid%TYPE, -- 指标计算主表ID
                         vClcExpCntnt IDX_CLC.CLC_EXP_CNTNT%TYPE, -- 指标计算表达式
                         vIdxVal      IDX_CLC.IDX_VAL%TYPE -- 指标默认值
                         ) RETURN VARCHAR2;

  FUNCTION f_avg(vVal in varchar2) RETURN NUMBER;

  FUNCTION f_npv(vRate    in number, --利率值
                 vIdxEcd2 in varchar2, --收益指标编码
                 vValtId  in varchar2 -- 估值ID
                 ) RETURN NUMBER;

  FUNCTION f_new_fixed_assets_val(vIdxClcId in varchar2, --指标计算主表ID
                                  vIdxEcd1  in varchar2, --投资额_指标编码
                                  vIdxEcd2  in varchar2 --建设期_指标编码
                                  ) RETURN NUMBER;

  FUNCTION f_under_build_project_val(vIdxClcId in varchar2, --指标计算主表ID
                                     vIdxEcd1  in varchar2, --投资额_指标编码
                                     vIdxEcd2  in varchar2 --建设期_指标编码
                                     ) RETURN NUMBER;

  FUNCTION f_current_depreciation_val(vIdxClcId in varchar2, --指标计算主表ID
                                      vIdxEcd1  in varchar2, --投资额_指标编码
                                      vIdxEcd2  in varchar2, --建设期_指标编码
                                      vIdxEcd3  in varchar2, --折旧年限_指标编码
                                      vIdxEcd4  in varchar2 --残值率_指标编码
                                      ) RETURN NUMBER;

  FUNCTION f_nyear(vIdxClcId in varchar2 --指标计算主表ID
                   ) RETURN NUMBER;

  FUNCTION f_sum_pre_profit(vIdxClcId in varchar2, --指标计算主表ID
                            vIdxEcd1  in varchar2 --资产减值损失_指标编码
                            ) RETURN NUMBER;

  FUNCTION ERROR_TO_NULL(vClcExpCntnt in varchar2) RETURN VARCHAR2;

  FUNCTION f_avg_fcs(vValtId in varchar2, -- 估值ID
                     vIdxEcd in varchar2 --指标编码
                     ) RETURN NUMBER;

  FUNCTION f_frct_ratnl_tst(vValtId in varchar2, -- 估值ID
                            vIdxEcd in varchar2 --指标编码
                            ) RETURN VARCHAR2;

  procedure proc_rcmm_ast_ref(vValtId in varchar2, -- 估值ID
                              vValtDt in varchar2, --估值日期（yyyyMMdd格式）
                              vIdyTp  in varchar2, --行业类别
                              vCstId  in varchar2, -- 客户编号
                              vOprId  in varchar2, -- 操作员编号
                              oi_flag out pls_integer, -- 1  成功  0 错误
                              os_msg  out varchar2 -- 出错信息
                              );

  procedure sp_rcmm_ast_parm(vValtId      in varchar2,
                             vParaDt      in varchar2,
                             vDfaltTp     in varchar2,
                             vIdxRefValTp in varchar2,
                             vCstId       in varchar2, -- 客户编号
                             vOprId       in varchar2, -- 操作员编号
                             oi_flag      out pls_integer,
                             os_msg       out varchar2);

  FUNCTION f_ratio(vIdxEcd in varchar2 --指标编码
                   ) RETURN NUMBER;

  procedure SP_RCMM_VALTMODLS(vValtId in varchar2, -- 估值ID
                              vParaDt in varchar2, -- 估值日期（yyyyMMdd格式）
                              vLstDt  in Date, -- 历史最近一期
                              vIdyTp  in varchar2, -- 行业类别【门类】
                              oi_flag out pls_integer, -- 1  成功  0 错误
                              os_msg  out varchar2 -- 出错信息
                              );

  procedure SP_REF_VALTMODL(vValtId in varchar2, -- 估值ID
                            vValtDt in varchar2, -- 估值日期（yyyyMMdd格式）
                            vIdyTp  in varchar2, -- 行业类别
                            vCstId  in varchar2, -- 客户编号
                            vOprId  in varchar2, -- 操作员编号
                            oi_flag out pls_integer, -- 1  成功  0 错误
                            os_msg  out varchar2 -- 出错信息
                            );
END PKG_VALT;
/
CREATE OR REPLACE PACKAGE BODY PKG_VALT as

  procedure proc_inlz_valtmodl_parm(vValtId in varchar2, -- 估值ID
                                    vValtDt in varchar2, -- 估值日期（yyyyMMdd格式）
                                    vIdyTp  in varchar2, -- 行业类别
                                    vCstId  in varchar2, -- 客户编号
                                    vOprId  in varchar2, -- 操作员编号
                                    oi_flag out pls_integer, -- 1  成功  0 错误
                                    os_msg  out varchar2 -- 出错信息
                                    ) as
    /*
     功    能: 集成接口1 【初始化估值模型参数】
     创 建 人: 林逸超
    */
    vHisStartYear number; -- 历史数据始于(年),如2016
    vHisEndYear   number; -- 历史数据止于(年)，如2018
    vLstDt        Date; -- 历史截止年，如to_date('20181231','yyyyMMdd')
    vPreStartYear number; -- 预测数据始于(年)，如2019
    vPreNum       number; -- 预测年数，如3
    vIdyTpSupr    varchar2(32);
    vParaDt       varchar2(8);
    /*addby张平 20201014*/
    v_count       PLS_INTEGER := 0; --统计指标初始化配置表计算顺序是否有为空的记录
    vValtId_P     CST_FNC_INF_IMPR.VALT_ID%type; -- 应用端发起的估值ID
  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';
    -- 超时处理
    proc_valt_rcrd(vValtId, '1', '0');

    --删除结果表 该估值ID的数据
    DELETE FROM SBJ_AND_IDX_CLC_RSLT WHERE VALT_ID = vValtId;
    --删除指标维护表 该估值ID的数据
    DELETE FROM IDX_MNT WHERE VALT_ID = vValtId;
    --删除计算详情表 该估值ID的数据
    DELETE FROM IDX_CLC_DTL T2
     WHERE exists (SELECT 1
              FROM IDX_CLC T1
             WHERE T1.VALT_ID = vValtId
               AND T1.IDX_CLCID = T2.IDX_CLCID);
    --删除计算表 该估值ID的数据
    DELETE FROM IDX_CLC T1 WHERE T1.VALT_ID = vValtId;
    --删除日志表 该估值ID的数据
    DELETE FROM IDX_CLC_LOG WHERE VALT_ID = vValtId;
    --删除指标维护历史表 该估值ID的数据
    DELETE FROM IDX_MNT_HIS WHERE VALT_ID = vValtId;
    --删除标的公司,可比公司 该估值ID的数据
    DELETE FROM OBJ_CSINF WHERE VALT_ID = vValtId;
    DELETE FROM OPT_CMPY_INF WHERE VALT_ID = vValtId;
    --删除预测合理性检验结果 该估值ID的数据
    DELETE FROM FRCT_RATNL_TST_RSLT WHERE VALT_ID = vValtId;

    -- 删除估值后台引入的财报记录
	  DELETE FROM T_FA_CST_FNC_INF_IMPR WHERE FNC_ANL_ASES_RPT_ID = vValtId;

    -- 后台记录引用的财报
    if substr(vValtId, 0 , 4) = 'REF_' then
      vValtId_P := substr(vValtId, 5);
      insert into T_FA_CST_FNC_INF_IMPR
        (CST_FNC_AMT_DSC, FNC_ANL_ASES_RPT_ID, CST_FNC_STDSC)
        select SEQ_T_FA_CST_FNC_INF_IMPR.Nextval,
               vValtId,
               i.CST_FNC_INF_ID
          from CST_FNC_INF_IMPR i
         where i.valt_id = vValtId_P;
    else
      insert into T_FA_CST_FNC_INF_IMPR
        (CST_FNC_AMT_DSC, FNC_ANL_ASES_RPT_ID, CST_FNC_STDSC)
        select SEQ_T_FA_CST_FNC_INF_IMPR.Nextval,
               vValtId,
               i.CST_FNC_INF_ID
          from CST_FNC_INF_IMPR i
         where i.valt_id = vValtId;
    end if;

    COMMIT;
    --记录入参
    proc_clc_log(vValtId,
                 'proc_inlz_valtmodl_parm',
                 '集成接口1，入参: vValtId->[' || vValtId || '],vValtDt->[' ||
                 vValtDt || '],' || 'vIdyTp->[' || vIdyTp || '],vCstId->[' ||
                 vCstId || '],' || 'vOprId->[' || vOprId || ']',
                 'INFO');

    --addby 张平 20201014
    SELECT COUNT(1)
      INTO v_count
      FROM IDX_INLZ_CFG
     WHERE (CLC_SEQ_NO IS NULL OR RESOLVE_FLAG IS NULL);
    --判断指标初始化配置表计算顺序是否有为空的记录，
    --如果有为空的记录则执行初始化配置明细脚本(在指标计算排骗序之前处理)
    IF v_count > 0 THEN
      --delete from rule_inlz_cfg_dtl;
      delete from rule_inlz_cfg_dtl a
       where exists (select 1
                from idx_inlz_cfg b
               where (b.clc_seq_no is null or b.resolve_flag is null)
                 and a.idx_inlz_cfg_id = b.idx_inlz_cfg_id);
      commit;
      proc_init_cfg_dtl('XX');
      proc_init_cfg_dtl('HE');
      proc_init_cfg_dtl('LY');
      proc_init_cfg_dtl('TY');
      proc_init_cfg_dtl('HY');
      proc_init_cfg_dtl('FY');
      proc_init_cfg_dtl('VD');
      proc_init_cfg_dtl('PV');
      proc_init_cfg_dtl('NE');
      proc_init_cfg_dtl('LE');
    END IF;

    --指标计算排序处理，为空则执行排序逻辑
    proc_idx_sort(vValtId, oi_flag, os_msg);

    --初始化各日期参数
    proc_inlz_common_date(vValtId, -- 估值ID
                          vIdyTp, -- 行业类别
                          vValtDt, -- 估值日期
                          vParaDt, -- 估值日期
                          vHisStartYear, --历史数据始于(年),如2016
                          vHisEndYear, --历史数据止于(年)，如2018
                          vLstDt, --历史截止年，如to_date('20181231','yyyyMMdd')
                          vPreStartYear, --预测数据始于(年)，如2019
                          vPreNum, --预测年数，如3
                          vIdyTpSupr,
                          oi_flag, -- 1  成功  0 错误
                          os_msg -- 出错信息
                          );

    --1.调proc_inlz_fnc_idx_val 初始化结果表
    proc_inlz_fnc_idx_val(vValtId, -- 估值ID
                          vValtDt,
                          vParaDt, --估值日期（yyyyMMdd格式）
                          vLstDt, -- 历史最近一期
                          vIdyTpSupr, --行业类别
                          vCstId, -- 客户编号
                          vOprId, -- 操作员编号
                          oi_flag,
                          os_msg);
    proc_clc_log(vValtId,
                 'proc_inlz_valtmodl_parm',
                 '1---' || oi_flag,
                 'INFO');
    --2.调proc_clc_idx计算标准财务指标
    proc_clc_idx(vValtId,
                 vParaDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 vPreNum,
                 '01',
                 oi_flag,
                 os_msg);
    proc_clc_log(vValtId,
                 'proc_inlz_valtmodl_parm',
                 '2---' || oi_flag,
                 'INFO');
    --3.调proc_clc_idx计算财报历史指标
    proc_clc_idx(vValtId,
                 vParaDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 vPreNum,
                 '02',
                 oi_flag,
                 os_msg);
    proc_clc_log(vValtId,
                 'proc_inlz_valtmodl_parm',
                 '3---' || oi_flag,
                 'INFO');
    --4.调proc_clc_idx计算综合评价指标
    proc_clc_idx(vValtId,
                 vParaDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 vPreNum,
                 '05',
                 oi_flag,
                 os_msg);
    proc_clc_log(vValtId,
                 'proc_inlz_valtmodl_parm',
                 '4---' || oi_flag,
                 'INFO');
    --5.调p_idx_mnt指标维护初始化
    proc_inlz_mnt_idx(vValtId, -- 估值ID
                      vLstDt, -- 历史最近一期
                      vIdyTp, --行业类别
                      vCstId, -- 客户编号
                      vOprId, -- 操作员编号
                      oi_flag, -- 1  成功  0 错误
                      os_msg);
    proc_clc_log(vValtId,
                 'proc_inlz_valtmodl_parm',
                 '5---' || oi_flag,
                 'INFO');
    --6.调proc_clc_idx计算估值模型指标
    proc_clc_idx(vValtId,
                 vParaDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 vPreNum,
                 '03',
                 oi_flag,
                 os_msg);
    proc_clc_log(vValtId,
                 'proc_inlz_valtmodl_parm',
                 '6---' || oi_flag,
                 'INFO');
    /**    **/
    --7.调SP_RCMM_VALTMODLS推荐备选和选中的估值模型
    SP_RCMM_VALTMODLS(vValtId, -- 估值ID
                      vParaDt, -- 估值日期（yyyyMMdd格式）
                      vLstDt, -- 历史最近一期
                      vIdyTpSupr, -- 行业类别【门类】
                      oi_flag, -- 1  成功  0 错误
                      os_msg);
    proc_clc_log(vValtId,
                 'SP_RCMM_VALTMODLS',
                 '7---' || oi_flag,
                 'INFO');

    --循环所有估值模型,初始化可选可比公司
    for item in (select '06' VALT_MODL_ECD
                   from dual
                 union all
                 select '07'
                   from dual
                 union all
                 select '08'
                   from dual
                 union all
                 select '09'
                   from dual
                 union all
                 select '10'
                   from dual
                 union all
                 select '11'
                   from dual) loop
      --9.调proc_rel_valt_samp_cmpy_rcmm初始化可选可比公司
      PKG_REL_VALT.proc_rel_valt_samp_cmpy_rcmm(vValtId, -- 估值ID
                                                vParaDt,
                                                vLstDt, -- 历史最近一期
                                                vIdyTp, -- 行业细分类别
                                                vCstId, -- 客户编号
                                                vOprId, -- 操作员编号
                                                item.VALT_MODL_ECD,
                                                oi_flag, -- 1  成功  0 错误
                                                os_msg -- 出错信息
                                                );
    end loop;
    proc_clc_log(vValtId,
                 'proc_rel_valt_samp_cmpy_rcmm',
                 '9---' || oi_flag,
                 'INFO');
    --10.调proc_clc_idx计算估值参数指标
    proc_clc_idx(vValtId,
                 vParaDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 vPreNum,
                 '04',
                 oi_flag,
                 os_msg);
    proc_clc_log(vValtId,
                 'proc_inlz_valtmodl_parm',
                 '10---' || oi_flag,
                 'INFO');
    --12.调proc_clc_idx计算投资期末指标
    proc_clc_idx(vValtId,
                 vParaDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 vPreNum,
                 '06',
                 oi_flag,
                 os_msg);
    proc_clc_log(vValtId, 'proc_clc_idx', '12---' || oi_flag, 'INFO');

    --13、更新指标维护表[被选中的预测方法编码]和[指标参考值]
    proc_adj_mnt_idx(vValtId,
                     vParaDt,
                     vLstDt,
                     vHisStartYear,
                     vHisEndYear,
                     vPreStartYear,
                     vIdyTpSupr,
                     vCstId,
                     vOprId,
                     oi_flag,
                     os_msg);
    proc_clc_log(vValtId, 'proc_adj_mnt_idx', '13---' || oi_flag, 'INFO');

    -- 基础资产法推荐结果
    proc_rcmm_ast_ref(vValtId,
                      vValtDt,
                      vIdyTp,
                      vCstId,
                      vOprId,
                      oi_flag,
                      os_msg);
    proc_clc_log(vValtId, 'proc_rcmm_ast_ref', '14---' || oi_flag, 'INFO');
    -- add 2021-10-26 新增指标的计算
    /**
    proc_clc_idx(vValtId,
                 vValtDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 3,
                 '07',
                 oi_flag,
                 os_msg);**/
    proc_clc_idx(vValtId,
                 vValtDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 3,
                 '08',
                 oi_flag,
                 os_msg);
    proc_clc_idx(vValtId,
                 vValtDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 3,
                 '07,09,10',
                 oi_flag,
                 os_msg);
    /**
    proc_clc_idx(vValtId,
                 vValtDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 3,
                 '10',
                 oi_flag,
                 os_msg);**/
    proc_clc_idx(vValtId,
                 vValtDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 3,
                 '11',
                 oi_flag,
                 os_msg);
    proc_clc_idx(vValtId,
                 vValtDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 3,
                 '12',
                 oi_flag,
                 os_msg);
    proc_clc_idx(vValtId,
                 vValtDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 3,
                 '13',
                 oi_flag,
                 os_msg);
    proc_clc_idx(vValtId,
                 vValtDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 3,
                 '14',
                 oi_flag,
                 os_msg);
    proc_clc_idx(vValtId,
                 vValtDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 3,
                 '15',
                 oi_flag,
                 os_msg);

    -- 超时处理
    proc_valt_rcrd(vValtId, '1', '1');
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_inlz_valtmodl_parm异常信息: [' ||
                 SUBSTR(SQLERRM, 1, 300) || ']，报错行数：[' ||
                 DBMS_UTILITY.format_error_backtrace || ']';
      -- 异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_inlz_valtmodl_parm', os_msg, 'ERROR');
      -- 超时处理
      proc_valt_rcrd(vValtId, '1', '1');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_inlz_valtmodl_parm;

  procedure proc_clc_valtmodl_idx(vValtId in varchar2, -- 估值ID
                                  vValtDt in varchar2, --估值日期（yyyyMMdd格式）
                                  vIdyTp  in varchar2, -- 行业类别
                                  vCstId  in varchar2, -- 客户编号
                                  vOprId  in varchar2, -- 操作员编号
                                  oi_flag out pls_integer, -- 1  成功  0 错误
                                  os_msg  out varchar2 -- 出错信息
                                  ) as
    /*
     功    能:  集成接口2 【计算估值模型指标】
     创 建 人: 桂鹏飞
    */
    vHisStartYear number; -- 历史数据始于(年),如2016
    vHisEndYear   number; -- 历史数据止于(年)，如2018
    vLstDt        Date; -- 历史截止年，如to_date('20181231','yyyyMMdd')
    vPreStartYear number; -- 预测数据始于(年)，如2019
    vPreNum       number; -- 预测年数，如3
    vIdyTpSupr    varchar2(32);
    vParaDt       varchar2(8);
  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';
    -- 超时处理
    proc_valt_rcrd(vValtId, '2', '0');
    --记录入参
    proc_clc_log(vValtId,
                 'proc_clc_valtmodl_idx',
                 '集成接口2，入参: vValtId->[' || vValtId || '],vValtDt->[' ||
                 vValtDt || '],' || 'vIdyTp->[' || vIdyTp || '],vCstId->[' ||
                 vCstId || '],' || 'vOprId->[' || vOprId || ']',
                 'INFO');
                 --删除计算详情表 该估值ID的数据
    DELETE FROM IDX_CLC_DTL T2
     WHERE exists (SELECT 1
              FROM IDX_CLC T1
             WHERE T1.VALT_ID = vValtId
               AND T1.IDX_CLCID = T2.IDX_CLCID);
    --删除计算表 该估值ID的数据
    DELETE FROM IDX_CLC T1 WHERE T1.VALT_ID = vValtId;
    delete from IDX_MNT_HIS where VALT_ID=vValtId;
    commit;
    --将集成接口2 调用开始时维护表数据备份至历史表 2_START
    INSERT INTO IDX_MNT_HIS
      (IDX_MNT_ID,
       IDX_ECD,
       SLCT_FRCT_MTH_ECD,
       IDX_VAL,
       IDX_RCMM_UPLM,
       IDX_RCMM_LWRLMT,
       CST_ID,
       VALT_ID,
       CRT_PSN_ID,
       CRT_TM,
       LAST_UDT_OPR_ID,
       MOD_TM,
       IDX_TPCD,
       IDX_REF_VAL,
       CRT_NODE)
      SELECT IDX_MNT_ID,
             IDX_ECD,
             SLCT_FRCT_MTH_ECD,
             IDX_VAL,
             IDX_RCMM_UPLM,
             IDX_RCMM_LWRLMT,
             CST_ID,
             VALT_ID,
             CRT_PSN_ID,
             CRT_TM,
             LAST_UDT_OPR_ID,
             MOD_TM,
             IDX_TPCD,
             IDX_REF_VAL,
             '2_START'
        FROM IDX_MNT
       WHERE VALT_ID = vValtId;
    --初始化各日期参数
    proc_inlz_common_date(vValtId, -- 估值ID
                          vIdyTp, -- 行业类别
                          vValtDt, -- 估值日期
                          vParaDt, -- 估值日期
                          vHisStartYear, --历史数据始于(年),如2016
                          vHisEndYear, --历史数据止于(年)，如2018
                          vLstDt, --历史截止年，如to_date('20181231','yyyyMMdd')
                          vPreStartYear, --预测数据始于(年)，如2019
                          vPreNum, --预测年数，如3
                          vIdyTpSupr,
                          oi_flag, -- 1  成功  0 错误
                          os_msg -- 出错信息
                          );

    --1、更新维护表 附属指标值
    PKG_VALT.proc_mnt_aflt_idx_val(vValtId,
                                   vCstId,
                                   vOprId,
                                   oi_flag,
                                   os_msg);
    proc_clc_log(vValtId,
                 'proc_mnt_aflt_idx_val',
                 '21---' || oi_flag,
                 'INFO');
    --更新结果表
    MERGE INTO SBJ_AND_IDX_CLC_RSLT R
    USING IDX_MNT M
    ON (M.IDX_ECD = R.IDX_ECD AND M.VALT_ID = R.VALT_ID AND R.VALT_ID = vValtId AND R.IDX_DT = TO_DATE(vParaDt, 'yyyyMMdd') and M.IDX_VAL is not null)
    WHEN MATCHED THEN
      UPDATE SET R.IDX_VAL = M.IDX_VAL, R.MOD_TM = SYSDATE;
    COMMIT;
    --2.调proc_clc_idx计算筹资期末指标
    proc_clc_idx(vValtId,
                 vParaDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 vPreNum,
                 '08',
                 oi_flag,
                 os_msg);
    proc_clc_log(vValtId, 'proc_clc_idx', '22---' || oi_flag, 'INFO');

    --3、计算预测参数指标
    PKG_VALT.proc_clc_idx(vValtId,
                          vParaDt,
                          vIdyTpSupr,
                          vCstId,
                          vOprId,
                          vHisStartYear,
                          vHisEndYear,
                          vPreStartYear,
                          vPreNum,
                          '07,09,10',
                          oi_flag,
                          os_msg);
    proc_clc_log(vValtId, 'proc_clc_idx', '23---' || oi_flag, 'INFO');
    --4、估值结果指标
    PKG_VALT.proc_clc_idx(vValtId,
                          vParaDt,
                          vIdyTpSupr,
                          vCstId,
                          vOprId,
                          vHisStartYear,
                          vHisEndYear,
                          vPreStartYear,
                          vPreNum,
                          '11',
                          oi_flag,
                          os_msg);
    proc_clc_log(vValtId, 'proc_clc_idx', '24---' || oi_flag, 'INFO');
    --5、财务分析指标
    PKG_VALT.proc_clc_idx(vValtId,
                          vParaDt,
                          vIdyTpSupr,
                          vCstId,
                          vOprId,
                          vHisStartYear,
                          vHisEndYear,
                          vPreStartYear,
                          vPreNum,
                          '12',
                          oi_flag,
                          os_msg);
    proc_clc_log(vValtId, 'proc_clc_idx', '25---' || oi_flag, 'INFO');
    --6、预测合理性检测指标
    PKG_VALT.proc_clc_idx(vValtId,
                          vParaDt,
                          vIdyTpSupr,
                          vCstId,
                          vOprId,
                          vHisStartYear,
                          vHisEndYear,
                          vPreStartYear,
                          vPreNum,
                          '13',
                          oi_flag,
                          os_msg);
    proc_clc_log(vValtId, 'proc_clc_idx', '26---' || oi_flag, 'INFO');
    --add 2021-10-28
    PKG_VALT.proc_clc_idx(vValtId,
                          vParaDt,
                          vIdyTpSupr,
                          vCstId,
                          vOprId,
                          vHisStartYear,
                          vHisEndYear,
                          vPreStartYear,
                          3,
                          '14',
                          oi_flag,
                          os_msg);
    proc_clc_log(vValtId, 'proc_clc_idx', '26-1--' || oi_flag, 'INFO');
    --保存预测合理性检验结果存储过程
    PKG_VALT.proc_frct_ratnl_tst(vValtId);
    --将集成接口2 调用结束时维护表数据备份至历史表 2_END
    INSERT INTO IDX_MNT_HIS
      (IDX_MNT_ID,
       IDX_ECD,
       SLCT_FRCT_MTH_ECD,
       IDX_VAL,
       IDX_RCMM_UPLM,
       IDX_RCMM_LWRLMT,
       CST_ID,
       VALT_ID,
       CRT_PSN_ID,
       CRT_TM,
       LAST_UDT_OPR_ID,
       MOD_TM,
       IDX_TPCD,
       IDX_REF_VAL,
       CRT_NODE)
      SELECT IDX_MNT_ID,
             IDX_ECD,
             SLCT_FRCT_MTH_ECD,
             IDX_VAL,
             IDX_RCMM_UPLM,
             IDX_RCMM_LWRLMT,
             CST_ID,
             VALT_ID,
             CRT_PSN_ID,
             CRT_TM,
             LAST_UDT_OPR_ID,
             MOD_TM,
             IDX_TPCD,
             IDX_REF_VAL,
             '2_END'
        FROM IDX_MNT
       WHERE VALT_ID = vValtId;
    DELETE FROM OPT_CMPY_INF
     WHERE VALT_ID = vValtId
       and SLCT <> 1;
    COMMIT;

    -- 计算资产基础法指标
    /**
    PKG_VALT.proc_clc_assets_idx(vValtId,
                                 vParaDt,
                                 vIdyTpSupr,
                                 vCstId,
                                 vOprId,
                                 vHisStartYear,
                                 vHisEndYear,
                                 vPreStartYear,
                                 vPreNum,
                                 '12',
                                 oi_flag,
                                 os_msg);**/
    PKG_VALT.proc_clc_assets_idx(vValtId,
                                 vParaDt,
                                 vIdyTpSupr,
                                 vCstId,
                                 vOprId,
                                 vHisStartYear,
                                 vHisEndYear,
                                 vPreStartYear,
                                 vPreNum,
                                 '12,14',
                                 oi_flag,
                                 os_msg);
    proc_clc_log(vValtId, 'proc_clc_idx', '27---' || oi_flag, 'INFO');
    --add 2021-12-27  新增了15层指标，计算需要14层指标
    PKG_VALT.proc_clc_idx(vValtId,
                          vParaDt,
                          vIdyTpSupr,
                          vCstId,
                          vOprId,
                          vHisStartYear,
                          vHisEndYear,
                          vPreStartYear,
                          3,
                          '15',
                          oi_flag,
                          os_msg);
    -- 超时处理
    proc_valt_rcrd(vValtId, '2', '1');
    update valt_rcrd set valt_modl_ecd=(select idx_val from idx_mnt where valt_id = vValtId and idx_ecd='O_P193') where valt_id= vValtId and valt_modl_ecd is null;
    commit;
    --select idx_val
    --into v_HEDate
    --from sbj_and_idx_clc_rslt icr where icr.valt_id= ''||vValtId||''
    --and idx_ecd = 'EndDate';
    --add 添加条款的生成
    PKG_FA.proc_clc_prvn(vValtId,
                         vParaDt,
                         vHisEndYear,
                         '05',
                         vIdyTp,
                         oi_flag,
                         os_msg);

    commit;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_clc_valtmodl_idx异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_clc_valtmodl_idx', os_msg, 'ERROR');
      -- 超时处理
      proc_valt_rcrd(vValtId, '2', '1');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_clc_valtmodl_idx;

  procedure proc_clc_assets_idx(vValtId       in varchar2, -- 估值ID
                                vParaDt       in varchar2, --估值日期（yyyyMMdd格式）
                                vIdyTpSupr    in varchar2, -- 行业类别
                                vCstId        in varchar2, -- 客户编号
                                vOprId        in varchar2, -- 操作员编号
                                vHisStartYear in number, -- 历史数据始于(年) 如：2016
                                vHisEndYear   in number, -- 历史数据止于(年) 如：2018
                                vPreStartYear in number, -- 预测数据始于(年) 如：2019
                                vPreNum       in number, -- 预测年数 如：3
                                vIdxTpcd      in varchar2, --指标类型编码（多个时以逗号隔开）
                                oi_flag       out pls_integer, -- 1  成功  0 错误
                                os_msg        out varchar2 -- 出错信息
                                ) as
    /*
     功    能: 【计算资产指标】
     创 建 人: 张平
    */
    vClcFlag PLS_INTEGER := 0;
  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';

    -- 前台未录入资产基础指标，则不计算
    select count(1)
      into vClcFlag
      from AST_IDX_MNT m
     where m.BEMRAQPRTY_VALT_TRCNO = vValtId
           --and m.plt_dtl = '1'
           ;
    if vClcFlag < 1 then
      return;
    end if;

    --1、 从资产指标维护表中取数并插入到科目及指标计算结果表
    MERGE INTO SBJ_AND_IDX_CLC_RSLT A
    USING (SELECT DE.IDX_ECD,
                  case when plt_dtl is null then '0' when plt_dtl='1' then crtcl_idx_val1 else '0' end IDX_VAL,
                  --to_date(vParaDt,'yyyyMMdd'),
                  --null,
                  --vValtId,
                  --vCstId
                  DE.DATA_TP_ECD,
                  DE.Data_Fmt,
                  --vOprId,
                  --SYSDATE,
                  --vOprId,
                  --SYSDATE
                  M.IDPY_CST_ID           CST_ID,
                  M.BEMRAQPRTY_VALT_TRCNO VALT_ID
             FROM IDX_DEF DE, AST_IDX_MNT M
            WHERE DE.IDX_ECD = M.IDX_SRC_ECD
              AND M.BEMRAQPRTY_VALT_TRCNO = vValtId
              --AND M.plt_dtl = '1'
              ) B
    ON (A.IDX_ECD = B.IDX_ECD AND A.IDX_DT = TO_DATE(vParaDt, 'yyyyMMdd') AND A.VALT_ID = B.VALT_ID AND B.VALT_ID = vValtId)
    WHEN MATCHED THEN
      UPDATE
         SET A.IDX_VAL     = B.IDX_VAL,
             A.CST_ID      = B.CST_ID,
             A.DATA_TP_ECD = B.Data_Tp_Ecd,
             A.Data_Fmt    = B.Data_Fmt,
             A.CRT_TM      = SYSDATE
    WHEN NOT MATCHED THEN
      INSERT
        (A.IDX_ECD,
         A.VALT_ID,
         A.IDX_VAL,
         A.IDX_DT,
         A.CST_ID,
         A.Crt_Psn_Id,
         A.CRT_TM,
         DATA_TP_ECD,
         Data_Fmt)
      VALUES
        (B.Idx_ECD,
         B.VALT_ID,
         B.IDX_VAL,
         TO_DATE(vParaDt, 'yyyyMMdd'),
         B.CST_ID,
         vOprId,
         SYSDATE,
         B.Data_Tp_Ecd,
         B.Data_Fmt);
    COMMIT;


    --3、调proc_clc_idx计算资产指标
    proc_clc_idx(vValtId,
                 vParaDt,
                 vIdyTpSupr,
                 vCstId,
                 vOprId,
                 vHisStartYear,
                 vHisEndYear,
                 vPreStartYear,
                 vPreNum,
                 vIdxTpcd,
                 oi_flag,
                 os_msg);

    proc_clc_log(vValtId,
                 'proc_clc_assets_idx.proc_clc_idx',
                 '资产基础法指标计算---' || oi_flag,
                 'INFO');

    COMMIT;

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_clc_assets_idx异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_clc_assets_idx', os_msg, 'ERROR');
      -- 超时处理
      --proc_valt_rcrd(vValtId, '2', '1');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_clc_assets_idx;

  procedure proc_init_cfg_dtl(vArgTp rule_inlz_cfg_dtl.idx_clc_arg_tp%TYPE) as

    os_msg VARCHAR2(1000);
    sl     VARCHAR2(1);
    vITp   rule_inlz_cfg_dtl.idx_clc_arg_tp%TYPE;
  BEGIN
    if vArgTp = 'XX' then
      sl   := '';
      vITp := '';
    else
      sl   := '_';
      vITp := vArgTp;
    end if;
    for vIdxCfgArr in (select *
                         from idx_inlz_cfg
                        where clc_seq_no is null
                           or resolve_flag is null) loop
      for vIdxArgArr in (select '[' || idx_ecd || sl || vITp || ']' as arg,
                                idx_ecd
                           from idx_def) loop

        if vIdxCfgArr.Clc_Exp_Cntnt is not null and
           instr(vIdxCfgArr.Clc_Exp_Cntnt, vIdxArgArr.Arg) > 0 then
          --dbms_output.put_line('计算表达式：{' || vIdxCfgArr.Clc_Exp_Cntnt ||
          --                     '}—指标编码：{' || vIdxArgArr.Arg || '}');
          insert into RULE_INLZ_CFG_DTL
            (IDX_INLZ_CFG_ID, IDX_CLC_ARG, IDX_ECD, IDX_CLC_ARG_TP)
          values
            (vIdxCfgArr.Idx_Inlz_Cfg_Id,
             vIdxArgArr.Idx_Ecd || sl || vITp,
             vIdxArgArr.Idx_Ecd,
             vArgTp);
        end if;
        if vIdxCfgArr.Idx_Nm is not null and
           instr(vIdxCfgArr.Idx_Nm, vIdxArgArr.Arg) > 0 then
          --dbms_output.put_line('条款：{' || vIdxCfgArr.Idx_Nm || '}—指标编码：{' ||
          --                     vIdxArgArr.Arg || '}');
          insert into RULE_INLZ_CFG_DTL
            (IDX_INLZ_CFG_ID, IDX_CLC_ARG, IDX_ECD, IDX_CLC_ARG_TP)
          values
            (vIdxCfgArr.Idx_Inlz_Cfg_Id,
             vIdxArgArr.Idx_Ecd || sl || vITp,
             vIdxArgArr.Idx_Ecd,
             vArgTp);
        end if;

      end loop;
      commit;
    end loop;

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      os_msg := 'proc_init_cfg_dtl异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --DBMS_OUTPUT.PUT_LINE(os_msg);
  END proc_init_cfg_dtl;

  procedure proc_idx_sort(vValtId in varchar2, -- 估值ID
                          oi_flag out pls_integer, -- 1  成功  0 错误
                          os_msg  out varchar2 -- 出错信息
                          ) as
    i          number := 3; --计算顺序
    n          number := 0; --临时变量记录剩余处理条数
    totalLineN number := 0; --未解决列表的总行数
    temp       number := 0; --临时计数变量
    temp2      number := 0; --临时计数变量
    v_count    PLS_INTEGER := 0;
  BEGIN
    oi_flag := 1;
    os_msg  := '指标编码计算排序存储过程';

    SELECT COUNT(1)
      INTO v_count
      FROM IDX_INLZ_CFG
     WHERE (CLC_GRPG_SN IS NULL OR CLC_SEQ_NO IS NULL);
    --判断指标初始化配置表计算顺序是否为空，为空则执行排序逻辑，否则直接结束
    IF v_count = 0 THEN
      RETURN;
    ELSE
      proc_clc_log(vValtId,
                   'proc_idx_sort',
                   '指标初始化配置表存在[分组序号]或[计算顺序]为空，开始执行计算排序存储过程[proc_idx_sort]',
                   'INFO');
    END IF;
    /*    while循环：
    select 主表 where 已解决标志=未解决
     条数为0 跳出

      顺序--》当前顺序+1
      主表循环--》
        如果关联的子表里面的所有ID都在已解决列表的
                 --》1. 插入子表，2.update 主表的已解决标志为【已解决】*/
    --清空已解决列表
    delete from ALREADY_RESOLVE;
    update IDX_INLZ_CFG set RESOLVE_FLAG = null;
    commit;
    --指标配置表计算表达式为空顺序1
    INSERT INTO ALREADY_RESOLVE
      (IDX_INLZ_CFG_ID, IDX_ECD, CLC_SEQ_NO)
      select IDX_INLZ_CFG_ID, IDX_ECD, '1'
        from IDX_INLZ_CFG A
       where RESOLVE_FLAG is null
         and A.CLC_EXP_CNTNT is null;
    UPDATE IDX_INLZ_CFG SET RESOLVE_FLAG = 'Y' WHERE CLC_EXP_CNTNT is null;
    --主表对应明细表的指标在主表不存在指标顺序2(即财报指标)
    for item in (select IDX_INLZ_CFG_ID, IDX_ECD
                   from IDX_INLZ_CFG
                  where RESOLVE_FLAG is null
                  order by IDX_INLZ_CFG_ID) loop
      --查询明细表不在主表条数和明细表条数是否相等
      select sum(a)
        into temp
        from (select count(*) a
                from RULE_INLZ_CFG_DTL r
               where r.IDX_INLZ_CFG_ID = item.IDX_INLZ_CFG_ID
                 and IDX_ECD not in (select IDX_ECD from IDX_INLZ_CFG)
              union
              select -count(*)
                from RULE_INLZ_CFG_DTL r
               where r.IDX_INLZ_CFG_ID = item.IDX_INLZ_CFG_ID);
      if temp = 0 then
        INSERT INTO ALREADY_RESOLVE
          (IDX_INLZ_CFG_ID, IDX_ECD, CLC_SEQ_NO)
          select IDX_INLZ_CFG_ID, IDX_ECD, '2'
            from IDX_INLZ_CFG A
           where A.IDX_INLZ_CFG_ID = item.IDX_INLZ_CFG_ID;
        UPDATE IDX_INLZ_CFG A
           SET RESOLVE_FLAG = 'Y'
         WHERE A.IDX_INLZ_CFG_ID = item.IDX_INLZ_CFG_ID;
      end if;
    end loop;

    commit;
    --查询剩余待解决总数
    select count(*)
      into totalLineN
      from IDX_INLZ_CFG
     where RESOLVE_FLAG is null;
    --循环条件未处理条数>0
    while totalLineN > 0 loop
      --循环主表待处理数据
      for item in (select IDX_INLZ_CFG_ID, IDX_ECD
                     from IDX_INLZ_CFG
                    where RESOLVE_FLAG is null
                    order by IDX_INLZ_CFG_ID) loop
        temp  := 0;
        temp2 := 0;
        IF item.IDX_INLZ_CFG_ID = 'A920' THEN
          dbms_output.put_line(item.IDX_INLZ_CFG_ID);
        END IF;
        --根据主表id查询明细表
        for item2 in (select IDX_ECD, IDX_CLC_ARG_TP
                        from RULE_INLZ_CFG_DTL
                       where IDX_INLZ_CFG_ID = item.IDX_INLZ_CFG_ID
                       group by IDX_INLZ_CFG_ID, IDX_ECD, IDX_CLC_ARG_TP) loop
          IF item2.IDX_CLC_ARG_TP not in ('LY', 'TY', 'HY', 'FY', 'HE') THEN
            --查询当前明细表指标是否是主表指标本身
            select count(*)
              into temp2
              from IDX_INLZ_CFG
             where IDX_ECD = item2.IDX_ECD
               and IDX_INLZ_CFG_ID = item.IDX_INLZ_CFG_ID;
            IF temp2 = 0 THEN
              select count(*)
                into temp
                from IDX_INLZ_CFG
               where IDX_ECD = item2.IDX_ECD
                 and (RESOLVE_FLAG <> 'Y' or RESOLVE_FLAG is null);
              --若明细表对应指标未处理就跳出
              IF temp > 0 THEN
                EXIT;
              END IF;
              --temp2>0代表明细表指标是主表本身
            ELSE
              temp := 0;
            END IF;
          END IF;

        end loop;
        --关联的子表里面的所有ID都在已解决列表的添加到已解决列表
        IF temp = 0 THEN

          INSERT INTO ALREADY_RESOLVE
            (IDX_INLZ_CFG_ID, IDX_ECD, CLC_SEQ_NO)
            select IDX_INLZ_CFG_ID, IDX_ECD, i
              from IDX_INLZ_CFG A
             where IDX_INLZ_CFG_ID = item.IDX_INLZ_CFG_ID;
          UPDATE IDX_INLZ_CFG A
             SET RESOLVE_FLAG = 'Y'
           WHERE IDX_INLZ_CFG_ID = item.IDX_INLZ_CFG_ID;
          i := i + 10;
        ELSE
          oi_flag := 2;
          --dbms_output.put_line('待处理' || item.IDX_INLZ_CFG_ID);
        END IF;

      end loop;
      commit;
      n := totalLineN;
      --查询未处理条数重新赋值
      select count(*)
        into totalLineN
        from IDX_INLZ_CFG
       where RESOLVE_FLAG is null;
      dbms_output.put_line('n:' || n || '     totalLineN:' || totalLineN);
      --若操作前待处理条数=操作后待处理条数,则证明出现死循环.
      --应排查剩余指标是否有互相依赖问题:例O_P167=O_P168,O_P168=O_P167
      if n = totalLineN then
        EXIT;
      END IF;
    end loop;
    dbms_output.put_line('处理完成');
    --更新指标配置表顺序
    UPDATE IDX_INLZ_CFG I
       SET I.CLC_GRPG_SN = '1',
           I.CLC_SEQ_NO =
           (select A.CLC_SEQ_NO
              from ALREADY_RESOLVE A
             where A.IDX_INLZ_CFG_ID = I.IDX_INLZ_CFG_ID)
     WHERE EXISTS (select 1
              from ALREADY_RESOLVE A
             where A.IDX_INLZ_CFG_ID = I.IDX_INLZ_CFG_ID);
    commit;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_idx_sort异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_idx_sort', os_msg, 'ERROR');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_idx_sort;

  procedure proc_inlz_common_date(vValtId       in varchar2, -- 估值ID
                                  vIdyTp        in varchar2, -- 行业类别
                                  vValtDt       in varchar2, -- 估值日期
                                  vParaDt       out varchar2, -- 估值日期
                                  vHisStartYear out number, --历史数据始于(年),如2016
                                  vHisEndYear   out number, --历史数据止于(年)，如2018
                                  vLstDt        out date, --历史截止年，如to_date('20181231','yyyyMMdd')
                                  vPreStartYear out number, --预测数据始于(年)，如2019
                                  vPreNum       out number, --预测年数，如3
                                  vIdyTpSupr    out varchar2, -- 行业大类
                                  oi_flag       out pls_integer, -- 1  成功  0 错误
                                  os_msg        out varchar2 -- 出错信息
                                  ) as
    /*
       功能：初始化供用日期参数
            历史数据起始年、历史数据截止年、预测起始年、预测年数
    **/
    v_count PLS_INTEGER := 0;
  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';
    --将传入估值日期20181231转为2018格式
    vParaDt := vValtDt;
    if substr(vValtDt, 5, 4) = '1231' then
      vParaDt := substr(vValtDt, 0, 4) || '1230';
    end if;
    --查询历史数据始于(年)
    select to_number(to_char(min(B.FNRPT_CODT), 'yyyy'))
      into vHisStartYear
      from T_FA_CST_FNC_INF_IMPR A, CST_FNC_INF B
     where A.CST_FNC_STDSC = B.CST_FNC_INF_ID
       and A.FNC_ANL_ASES_RPT_ID = vValtId;

    --查询历史数据止于(年)
    select to_number(to_char(max(B.FNRPT_CODT), 'yyyy'))
      into vHisEndYear
      from T_FA_CST_FNC_INF_IMPR A, CST_FNC_INF B
     where A.CST_FNC_STDSC = B.CST_FNC_INF_ID
       and A.FNC_ANL_ASES_RPT_ID = vValtId;

    --查询历史截止年
    select to_date(to_char(max(B.FNRPT_CODT), 'yyyy') || '1231', 'yyyyMMdd')
      into vLstDt
      from T_FA_CST_FNC_INF_IMPR A, CST_FNC_INF B
     where A.CST_FNC_STDSC = B.CST_FNC_INF_ID
       and A.FNC_ANL_ASES_RPT_ID = vValtId;

    --查询预测数据始于(年)
    select count(1)
      into v_count
      from IDX_MNT
     where IDX_ECD = 'O_P97'
       and VALT_ID = vValtId and IDX_VAL is not null;
    IF v_count > 0 THEN
      select to_number(IDX_VAL)
        into vPreStartYear
        from IDX_MNT
       where IDX_ECD = 'O_P97'
         and VALT_ID = vValtId;
    ELSE
      --默认为历史数据截止年 + 1
      select to_number(to_char(max(B.FNRPT_CODT), 'yyyy')) + 1
        into vPreStartYear
        from T_FA_CST_FNC_INF_IMPR A, CST_FNC_INF B
       where A.CST_FNC_STDSC = B.CST_FNC_INF_ID
         and A.FNC_ANL_ASES_RPT_ID = vValtId;
    END IF;
    update IDX_MNT set IDX_VAL= vPreStartYear where VALT_ID = vValtId and IDX_ECD = 'O_P97';
    commit;
    vPreNum :=3;
    --查询预测年数
    select count(1)
      into v_count
      from IDX_MNT
     where IDX_ECD = 'O_P96'
       and VALT_ID = vValtId and IDX_VAL is not null;
    IF v_count > 0 THEN
      select nvl(to_number(IDX_VAL),3)
        into vPreNum
        from IDX_MNT
       where IDX_ECD = 'O_P96'
         and VALT_ID = vValtId;
    END IF;
    update IDX_MNT set IDX_VAL= vPreNum where VALT_ID = vValtId and IDX_ECD = 'O_P96';
    commit;
    --递归查询获取行业大类
    with IdyTree as
     (select *
        from code c
       start with c.cd_val = vIdyTp
              and c.cd_tp_ecd = 'Idy_Tp'
      connect by prior supr_cd = cd_val)
    select count(1) into v_count from IdyTree where cd_lvl = 1;
    IF v_count > 0 THEN
      with IdyTree as
       (select *
          from code c
         start with c.cd_val = vIdyTp
                and c.cd_tp_ecd = 'Idy_Tp'
        connect by prior supr_cd = cd_val)
      select cd_val into vIdyTpSupr from IdyTree where cd_lvl = 1;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_inlz_common_date异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_inlz_common_date', os_msg, 'ERROR');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_inlz_common_date;

  procedure proc_inlz_fnc_idx_val(vValtId    in varchar2, -- 估值ID
                                  vValtDt    in varchar2, --估值日期（yyyyMMdd格式）
                                  vParaDt    in varchar2, --估值日期（yyyyMMdd格式）
                                  vLstDt     in Date, -- 历史最近一期
                                  vIdyTpSupr in varchar2, -- 行业类别
                                  vCstId     in varchar2, -- 客户编号
                                  vOprId     in varchar2, -- 操作员编号
                                  oi_flag    out pls_integer, -- 1  成功  0 错误
                                  os_msg     out varchar2 -- 出错信息
                                  ) as
    /*
      初始化【指标计算结果表】数据
    **/
    vRet       varchar2(2000);
    vLstYmr    varchar2(20);
    vLstYmrNum number;
    vCurYear   number;
  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';
    --1. 初始化[财务报表数据]至结果表
    INSERT INTO SBJ_AND_IDX_CLC_RSLT
      (IDX_ECD,
       IDX_DT,
       IDX_VAL,
       IDX_CLCID,
       VALT_ID,
       CST_ID,
       DATA_TP_ECD,
       DATA_FMT,
       CRT_PSN_ID,
       CRT_TM,
       LAST_UDT_OPR_ID,
       MOD_TM)
      WITH TEMP_FINANCE AS
       (SELECT DE.IDX_ECD,
               NVL(DE.DFALT_VAL, '0') DFALT_VAL,
               F.CST_FNC_INF_ID,
               F.FNRPT_CODT
          FROM IDX_DEF DE, CST_FNC_INF F, T_FA_CST_FNC_INF_IMPR I
         WHERE F.CST_FNC_INF_ID = I.CST_FNC_STDSC
           AND DE.DFALT_TP = '01'
           AND I.FNC_ANL_ASES_RPT_ID = vValtId)
      SELECT I.IDX_ECD,
             TO_DATE(TO_CHAR(I.FNRPT_CODT, 'yyyy') || '1231', 'yyyyMMdd'),
             NVL(F.IDX_VAL, I.DFALT_VAL) IDX_VAL,
             NULL,
             vValtId,
             vCstId,
             '01',
             NULL,
             vOprId,
             SYSDATE,
             vOprId,
             SYSDATE
        FROM TEMP_FINANCE I
        LEFT JOIN STD_ENTP_FNRPT F
          ON I.CST_FNC_INF_ID = F.CST_FNC_INF_ID
         AND I.FNRPT_CODT = F.FNRPT_CODT
         AND I.IDX_ECD = F.IDX_ECD;
    --2. 初始化[估值日期]至结果表，指标日期=估值日期，指标值='估值日期'
    insert into SBJ_AND_IDX_CLC_RSLT
      (IDX_ECD,
       IDX_DT,
       IDX_VAL,
       IDX_RCMM_UPLM,
       IDX_RCMM_LWRLMT,
       IDX_CLCID,
       VALT_ID,
       CST_ID,
       DATA_TP_ECD,
       DATA_FMT,
       CRT_PSN_ID,
       CRT_TM,
       LAST_UDT_OPR_ID,
       MOD_TM)
    values
      ('EstiDate',
       to_date(vParaDt, 'yyyyMMdd'),
       vValtDt,
       null,
       null,
       null,
       vValtId,
       vCstId,
       '03',
       null,
       vOprId,
       sysdate,
       vOprId,
       sysdate);

    --3. 初始化[财报截止日期]至结果表，指标日期=估值日期，指标值='财务报表截止日期'
    insert into SBJ_AND_IDX_CLC_RSLT
      (IDX_ECD,
       IDX_DT,
       IDX_VAL,
       IDX_RCMM_UPLM,
       IDX_RCMM_LWRLMT,
       IDX_CLCID,
       VALT_ID,
       CST_ID,
       DATA_TP_ECD,
       DATA_FMT,
       CRT_PSN_ID,
       CRT_TM,
       LAST_UDT_OPR_ID,
       MOD_TM)
    values
      ('EndDate',
       to_date(vParaDt, 'yyyyMMdd'),
       to_char(vLstDt, 'yyyyMMdd'),
       null,
       null,
       null,
       vValtId,
       vCstId,
       '03',
       null,
       vOprId,
       sysdate,
       vOprId,
       sysdate);

    --3. 初始化[行业类别]至结果表，指标日期=估值日期
    insert into SBJ_AND_IDX_CLC_RSLT
      (IDX_ECD,
       IDX_DT,
       IDX_VAL,
       IDX_RCMM_UPLM,
       IDX_RCMM_LWRLMT,
       IDX_CLCID,
       VALT_ID,
       CST_ID,
       DATA_TP_ECD,
       DATA_FMT,
       CRT_PSN_ID,
       CRT_TM,
       LAST_UDT_OPR_ID,
       MOD_TM)
    values
      ('FRM',
       to_date(vParaDt, 'yyyyMMdd'),
       vIdyTpSupr,
       null,
       null,
       null,
       vValtId,
       vCstId,
       '04',
       null,
       vOprId,
       sysdate,
       vOprId,
       sysdate);
    COMMIT;
    --add 新增gz开发的指标数据
    /**
     --gs_001 --gs_018
     insert into SBJ_AND_IDX_CLC_RSLT
       (IDX_ECD,
        IDX_DT,
        IDX_VAL,
        IDX_RCMM_UPLM,
        IDX_RCMM_LWRLMT,
        IDX_CLCID,
        VALT_ID,
        CST_ID,
        DATA_TP_ECD,
        DATA_FMT,
        CRT_PSN_ID,
        CRT_TM,
        LAST_UDT_OPR_ID,
        MOD_TM)
    select idx_ecd,
           vLstDt,
           (select cst_nm from corp_cst_bsc_inf where cst_id = vCstId),
           null,
           null,
           null,
           vValtId,
           vCstId,
           data_tp_ecd,
           data_fmt,
           vOprId,
           sysdate,
           vOprId,
           sysdate
    from idx_def where idx_ecd like 'gs%';
    */
    
    --添加字段 P_O 和P_10
    vRet := 'select to_number(substr(idx_val,0,4)) from sbj_and_idx_clc_rslt icr where icr.valt_id=''' ||
            vValtId || ''' and idx_ecd=''EndDate''';
    execute immediate vRet
      into vLstYmrNum;
    vCurYear := vLstYmrNum - 8;
    WHILE vCurYear <= vLstYmrNum + 4 LOOP
      insert into SBJ_AND_IDX_CLC_RSLT
        (IDX_ECD,
         IDX_DT,
         IDX_VAL,
         IDX_RCMM_UPLM,
         IDX_RCMM_LWRLMT,
         IDX_CLCID,
         VALT_ID,
         CST_ID,
         DATA_TP_ECD,
         DATA_FMT,
         CRT_PSN_ID,
         CRT_TM,
         LAST_UDT_OPR_ID,
         MOD_TM)
      values
        ('P_0',
         to_date(vCurYear || '1231', 'yyyyMMdd'),
         vCurYear,
         null,
         null,
         null,
         vValtId,
         vCstId,
         '04',
         null,
         vOprId,
         sysdate,
         vOprId,
         sysdate);
      commit;
      vCurYear := vCurYear + 1;
    END LOOP;
    insert into SBJ_AND_IDX_CLC_RSLT
      (IDX_ECD,
       IDX_DT,
       IDX_VAL,
       IDX_RCMM_UPLM,
       IDX_RCMM_LWRLMT,
       IDX_CLCID,
       VALT_ID,
       CST_ID,
       DATA_TP_ECD,
       DATA_FMT,
       CRT_PSN_ID,
       CRT_TM,
       LAST_UDT_OPR_ID,
       MOD_TM)
    values
      ('P_10',
       to_date(vLstYmrNum || '1231', 'yyyyMMdd'),
       (select cd_mean_dsc
          from code
         where cd_tp_ecd = 'Idy_Tp'
           and cd_val = vIdyTpSupr),
       null,
       null,
       null,
       vValtId,
       vCstId,
       '04',
       null,
       vOprId,
       sysdate,
       vOprId,
       sysdate);
    commit;
    dbms_output.put_line('vIdyTpSupr->' || vIdyTpSupr ||';vValtId->'||vValtId||';');
    --更新gs的采集数据
    delete from SBJ_AND_IDX_CLC_RSLT where VALT_ID=vValtId and idx_ecd in (select idx_ecd from  t_fa_valt_survey where trim(intlg_valt_id)= vValtId);
    commit;
    --add 问卷采集数据 20211118
    insert into SBJ_AND_IDX_CLC_RSLT
      (IDX_ECD,
       IDX_DT,
       IDX_VAL,
       IDX_RCMM_UPLM,
       IDX_RCMM_LWRLMT,
       IDX_CLCID,
       VALT_ID,
       CST_ID,
       DATA_TP_ECD,
       DATA_FMT,
       CRT_PSN_ID,
       CRT_TM,
       LAST_UDT_OPR_ID,
       MOD_TM)
      select idx_ecd,
             to_date(vParaDt, 'yyyyMMdd'),
             tx_tp_idx_val,
             null,
             null,
             null,
             vValtId,
             vCstId,
             '03',
             null,
             vOprId,
             sysdate,
             vOprId,
             sysdate
        from t_fa_valt_survey
       where trim(intlg_valt_id)= trim('' || vValtId || '');

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_inlz_fnc_idx_val异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']' || vRet;
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_inlz_fnc_idx_val', os_msg, 'ERROR');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_inlz_fnc_idx_val;

  procedure proc_clc_idx(vValtId       in varchar2, -- 估值ID
                         vParaDt       in varchar2, --估值日期（yyyyMMdd格式）
                         vIdyTpSupr    in varchar2, -- 行业类别
                         vCstId        in varchar2, -- 客户编号
                         vOprId        in varchar2, -- 操作员编号
                         vHisStartYear in number, -- 历史数据始于(年) 如：2016
                         vHisEndYear   in number, -- 历史数据止于(年) 如：2018
                         vPreStartYear in number, -- 预测数据始于(年) 如：2019
                         vPreNum       in number, -- 预测年数 如：3
                         vIdxTpcd      in varchar2, --指标类型编码（多个时以逗号隔开）
                         oi_flag       out pls_integer, -- 1  成功  0 错误
                         os_msg        out varchar2 -- 出错信息
                         ) as
    /*
     功    能: 指标初始化配置表-->指标计算表-->科目及指标计算结果表 过程处理
     创 建 人: 桂鹏飞
    */
  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';
    --1、调用通用指标算法：指标初始化配置表-->指标计算表
    PKG_VALT.proc_valt_common_indexcal(vValtId,
                                       vParaDt,
                                       vIdyTpSupr,
                                       vCstId,
                                       vOprId,
                                       vHisStartYear,
                                       vHisEndYear,
                                       vPreStartYear,
                                       vPreNum,
                                       vIdxTpcd,
                                       'X',
                                       oi_flag,
                                       os_msg);
    --2、指标计算表-->科目及指标计算结果表
    PKG_VALT.proc_valt_clc(vValtId,
                           vIdxTpcd,
                           vCstId,
                           vOprId,
                           oi_flag,
                           os_msg);
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_clc_idx异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_clc_idx', os_msg, 'ERROR');
      --RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_clc_idx;

  procedure proc_valt_common_indexcal(vValtId       in varchar2, -- 估值ID
                                      vParaDt       in varchar2, --估值日期（yyyyMMdd格式）
                                      vIdyTpSupr    in varchar2, -- 行业类别
                                      vCstId        in varchar2, -- 客户编号
                                      vOprId        in varchar2, -- 操作员编号
                                      vHisStartYear in number, -- 历史数据始于(年) 如：2016
                                      vHisEndYear   in number, -- 历史数据止于(年) 如：2018
                                      vPreStartYear in number, -- 预测数据始于(年) 如：2019
                                      vPreNum       in number, -- 预测年数 如：3
                                      vIdxTpcd      in varchar2, --指标类型编码（多个时以逗号隔开）
                                      vScmRcmm      in varchar2, --推荐方案编码，默认为X公用方案
                                      oi_flag       out pls_integer, -- 1  成功  0 错误
                                      os_msg        out varchar2 -- 出错信息
                                      ) as
    --预测数据截止年
    vPreEndYear NUMBER(4);
    --循环处理，当前年份
    vCurYear NUMBER(4);
    --定义游标
    TYPE CURSOR_TYPE IS REF CURSOR;
    curArgData    CURSOR_TYPE;
    curArgDtlData CURSOR_TYPE;

    v_HIST_PRD_NUM_ECD VARCHAR2(20);
    v_FRCT_PRD_NUM_ECD VARCHAR2(20);
    v_VALT_PRD_NUM_ECD VARCHAR2(20);
    vRcmmScmEcd        VARCHAR2(20);
    --指标计算表参数
    vGetArgSQL        VARCHAR2(4000);
    vStartSql         VARCHAR2(4000);
    vEndSql           VARCHAR2(4000);
    vWhereSql         VARCHAR2(4000);
    v_IDX_CLCID       VARCHAR2(32);
    v_IDX_INLZ_CFG_ID VARCHAR2(240);
    v_IDX_ECD         VARCHAR2(20);
    v_IDX_TPCD        VARCHAR2(20);
    v_IDX_NM          VARCHAR2(500);
    v_CLC_EXP_CNTNT   VARCHAR2(2000);
    v_IDX_DT          VARCHAR2(10);
    v_IDX_MNT_ID      VARCHAR2(240);
    v_IDX_VAL         VARCHAR2(30);
    v_CLC_GRPG_SN     NUMBER;
    v_CLC_SEQ_NO      NUMBER;

    --指标计算详情表参数
    vGetArgDtlSQL        VARCHAR2(4000);
    v_dtl_IDX_CLC_ARG    VARCHAR2(20);
    v_dtl_IDX_ECD        VARCHAR2(20);
    v_dtl_IDX_CLC_ARG_TP VARCHAR2(20);
    v_dtl_IDX_DT         VARCHAR2(10);

  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';
    proc_clc_log(vValtId,
                 'p_valt_common_indexcal',
                 'p_valt_common_indexcal STRAT：当前处理指标类型编码： ' || vIdxTpcd,
                 'INFO');
    --推荐方案编码：传A或B方案时，为预生成预测起始年的数据，默认为X共用方案
    IF vScmRcmm IS NULL THEN
      vRcmmScmEcd := 'X';
    ELSE
      vRcmmScmEcd := vScmRcmm;
    END IF;
    /**
     查询待计算信息：
     1、根据历史期数编码、预测期数编码、估值期数编码分别生成
     2、初始化配置表关联维护表（指标编码+预测方法编码），能关联上说明需按此预测方法编码这条对应的公式来计算；
     3、指标默认值，优先级为：
        （1）若关联到维护表，但维护表指标编码为主指标编码，且选中的预测方法为02自定义时，
             此指标值的意义实际为其附属编码的指标值，故不能取默认值，还是需要按公式计算。
        （2）关联到维护表，且被选中的预测方法为【金额=0】是，指标值为0
        （3）关联到维护表，且维护表指标值不为空，说明页面调整了指标值，默认按此值生成结果
        （4）初始化配置表默认值不为空，则取此默认值
     4、推荐方案编码：传A或B方案时，为预生成预测起始年的数据，故不用处理历史和估值的期数编码
    */
    vStartSql := ' SELECT IDX_INLZ_CFG_ID,IDX_ECD,IDX_TPCD,IDX_NM,CLC_EXP_CNTNT, ' ||
                 '        IDX_MNT_ID,IDX_VAL,CLC_GRPG_SN,CLC_SEQ_NO, ' ||
                 '        HIST_PRD_NUM_ECD,FRCT_PRD_NUM_ECD,VALT_PRD_NUM_ECD ' ||
                 '   FROM ( SELECT ROW_NUMBER() OVER(' ||
                 '             PARTITION BY T.IDX_ECD, T.IDX_TPCD ' ||
                 '             ORDER BY CASE WHEN IM.IDX_MNT_ID IS NOT NULL THEN 1 ELSE 2 END ' ||
                 '          ) RN,' ||
                 '          T.IDX_INLZ_CFG_ID, T.IDX_ECD,T.IDX_TPCD, T.IDX_NM, T.CLC_EXP_CNTNT,IM.IDX_MNT_ID, ' ||
                 '          CASE WHEN AF.IDX_ECD IS NOT NULL THEN NULL ' ||
                 '               WHEN IM.SLCT_FRCT_MTH_ECD = ''07'' THEN ''0'' ' ||
                 '               WHEN IM.IDX_VAL IS NOT NULL THEN IM.IDX_VAL ' ||
                 '               ELSE T.IDX_DFALT_VAL END IDX_VAL,' ||
                 '          T.CLC_GRPG_SN,T.CLC_SEQ_NO, ' ||
                 '          T.HIST_PRD_NUM_ECD,T.FRCT_PRD_NUM_ECD,T.VALT_PRD_NUM_ECD ' ||
                 '     FROM IDX_INLZ_CFG T ' ||
                 '     LEFT JOIN IDX_MNT IM ON T.IDX_ECD = IM.IDX_ECD ' ||
                 '      AND NVL(T.SLCT_FRCT_MTH_ECD,''wu'') = NVL(IM.SLCT_FRCT_MTH_ECD,''wu'') ' ||
                 '      AND T.IDX_TPCD = IM.IDX_TPCD  ' ||
                 '      AND IM.VALT_ID = ''' || vValtId || '''' ||
                 '      LEFT JOIN ( ' ||
                 '       SELECT M2.IDX_ECD,M2.IDX_VAL ' ||
                 '         FROM IDX_INLZ_CFG T2 ' ||
                 '        INNER JOIN IDX_MNT M2 ' ||
                 '           ON T2.AFLT_IDX_ECD = M2.IDX_ECD ' ||
                 '          AND T2.SLCT_FRCT_MTH_ECD = M2.SLCT_FRCT_MTH_ECD ' ||
                 '          AND T2.SLCT_FRCT_MTH_ECD = ''02'' ' ||
                 '          AND M2.VALT_ID = ''' || vValtId || '''' ||
                 '     ) AF ON T.IDX_ECD = AF.IDX_ECD AND T.SLCT_FRCT_MTH_ECD = ''02'' ' ||
                 ' WHERE T.IDX_TPCD IN (' || vIdxTpcd || ') ' ||
                 '   AND T.RCMM_SCM_ECD = ''' || vRcmmScmEcd || ''' ';
    --查询条件 vWhereSql
    vEndSql := '  ) WHERE RN = 1 ';

    IF vRcmmScmEcd = 'X' THEN
      --1、处理历史期数编码：02历史最新一期 03全部期数，其余不生成历史指标
      vWhereSql := ' AND T.HIST_PRD_NUM_ECD IN ( ''02'',''03'') ';
      --拼接sql
      vGetArgSQL := vStartSql || vWhereSql || vEndSql;
      OPEN curArgData FOR vGetArgSQL;
      LOOP
        FETCH curArgData
          INTO v_IDX_INLZ_CFG_ID,
               v_IDX_ECD,
               v_IDX_TPCD,
               v_IDX_NM,
               v_CLC_EXP_CNTNT,
               v_IDX_MNT_ID,
               v_IDX_VAL,
               v_CLC_GRPG_SN,
               v_CLC_SEQ_NO,
               v_HIST_PRD_NUM_ECD,
               v_FRCT_PRD_NUM_ECD,
               v_VALT_PRD_NUM_ECD;
        EXIT WHEN curArgData%NOTFOUND;
        --判断历史期数编码,02生成历史最新一期； 03生成全部期数
        IF v_HIST_PRD_NUM_ECD = '02' THEN
          vCurYear := vHisEndYear;
        ELSE
          vCurYear := vHisStartYear;
        END IF;

        WHILE vCurYear <= vHisEndYear LOOP
          BEGIN
            --生成指标计算表ID
            v_IDX_CLCID := SEQ_IDX_CLC.NEXTVAL;
            --指标计算表日期
            v_IDX_DT := vCurYear || '1231';

            --插入指标计算表
            insert into IDX_CLC
              (IDX_CLCID,
               IDX_ECD,
               IDX_DT,
               CLC_EXP_CNTNT,
               IDX_VAL,
               CLC_GRPG_SN,
               CLC_SEQ_NO,
               IDX_INLZ_CFG_ID,
               FRCT_MTH_MNTID,
               VALT_ID,
               OPR_ID,
               CST_ID,
               CRT_TM)
            values
              (v_IDX_CLCID,
               v_IDX_ECD,
               to_date(v_IDX_DT, 'yyyyMMdd'),
               v_CLC_EXP_CNTNT,
               v_IDX_VAL,
               v_CLC_GRPG_SN,
               v_CLC_SEQ_NO,
               v_IDX_INLZ_CFG_ID,
               v_IDX_MNT_ID,
               vValtId,
               vOprId,
               vCstId,
               sysdate);
            --处理指标计算明细表
            vGetArgDtlSQL := 'SELECT T2.IDX_CLC_ARG, T2.IDX_ECD, T2.IDX_CLC_ARG_TP ' ||
                             '  FROM RULE_INLZ_CFG_DTL T2 ' ||
                             ' WHERE T2.IDX_INLZ_CFG_ID = ''' ||
                             v_IDX_INLZ_CFG_ID || '''';
            OPEN curArgDtlData FOR vGetArgDtlSQL;
            LOOP
              FETCH curArgDtlData
                INTO v_dtl_IDX_CLC_ARG, v_dtl_IDX_ECD, v_dtl_IDX_CLC_ARG_TP;
              EXIT WHEN curArgDtlData%NOTFOUND;
              --详情表 指标计算日期
              --VD 估值日期，其余循环历史年份中的当前年份
              IF v_dtl_IDX_CLC_ARG_TP = 'VD' THEN
                v_dtl_IDX_DT := vParaDt;
              ELSIF v_dtl_IDX_CLC_ARG_TP = 'LY' THEN
                v_dtl_IDX_DT := (vCurYear - 1) || '1231';
              ELSIF v_dtl_IDX_CLC_ARG_TP = 'TY' THEN
                v_dtl_IDX_DT := (vCurYear - 2) || '1231';
              ELSIF v_dtl_IDX_CLC_ARG_TP = 'HY' THEN
                v_dtl_IDX_DT := (vCurYear - 3) || '1231';
              ELSIF v_dtl_IDX_CLC_ARG_TP = 'FY' THEN
                v_dtl_IDX_DT := (vCurYear - 4) || '1231';
              ELSE
                v_dtl_IDX_DT := vCurYear || '1231';
              END IF;
              --插入指标计算明细表
              insert into IDX_CLC_DTL
                (IDX_CLCID, IDX_CLC_ARG, IDX_ECD, IDX_DT)
              values
                (v_IDX_CLCID,
                 v_dtl_IDX_CLC_ARG,
                 v_dtl_IDX_ECD,
                 to_date(v_dtl_IDX_DT, 'yyyyMMdd'));

            END LOOP;
            CLOSE curArgDtlData;

            vCurYear := vCurYear + 1;
          END;
        END LOOP;

      END LOOP;
      CLOSE curArgData;
      COMMIT;
      proc_clc_log(vValtId,
                   'p_valt_common_indexcal',
                   '1.历史期数编码处理成功',
                   'INFO');
    ELSE
      proc_clc_log(vValtId,
                   'p_valt_common_indexcal',
                   '1.生成预计算数据，历史期数编码已跳过',
                   'INFO');
    END IF;
    --1.END

    --2、处理预测指标 预测期数编码：03全部期数，其余不生成预测指标
    IF vPreStartYear IS NOT NULL AND vPreNum IS NOT NULL THEN
      --如预测起始年为2019，预测年数1年，则起始年、截止年都为2019，指标计算表插入一条指标日期为2019/12/31的数据
      vPreEndYear := vPreStartYear + vPreNum - 1;

      vWhereSql := ' AND T.FRCT_PRD_NUM_ECD = ''03'' ';
      --拼接sql
      vGetArgSQL := vStartSql || vWhereSql || vEndSql;
      if vIdxTpcd = '10' then
        dbms_output.put_line('yc->vGetArgSQL>' || vGetArgSQL);
      end if;
       dbms_output.put_line(vGetArgSQL);
      OPEN curArgData FOR vGetArgSQL;
      LOOP
        FETCH curArgData
          INTO v_IDX_INLZ_CFG_ID,
               v_IDX_ECD,
               v_IDX_TPCD,
               v_IDX_NM,
               v_CLC_EXP_CNTNT,
               v_IDX_MNT_ID,
               v_IDX_VAL,
               v_CLC_GRPG_SN,
               v_CLC_SEQ_NO,
               v_HIST_PRD_NUM_ECD,
               v_FRCT_PRD_NUM_ECD,
               v_VALT_PRD_NUM_ECD;
        EXIT WHEN curArgData%NOTFOUND;
        --预测指标 指标日期从预测数据起始年到截止年，每年生成一条（详情表的指标日期根据指标计算变量类型特殊处理）
        --预测期数编码：03全部期数，其余不生成预测指标
        vCurYear := vPreStartYear;
        WHILE vCurYear <= vPreEndYear LOOP
          BEGIN
            --生成指标计算表ID
            v_IDX_CLCID := SEQ_IDX_CLC.NEXTVAL;
            --指标计算表日期
            v_IDX_DT := vCurYear || '1231';

            --插入指标计算表
            insert into IDX_CLC
              (IDX_CLCID,
               IDX_ECD,
               IDX_DT,
               CLC_EXP_CNTNT,
               IDX_VAL,
               CLC_GRPG_SN,
               CLC_SEQ_NO,
               IDX_INLZ_CFG_ID,
               FRCT_MTH_MNTID,
               VALT_ID,
               OPR_ID,
               CST_ID,
               CRT_TM)
            values
              (v_IDX_CLCID,
               v_IDX_ECD,
               to_date(v_IDX_DT, 'yyyyMMdd'),
               v_CLC_EXP_CNTNT,
               v_IDX_VAL,
               v_CLC_GRPG_SN,
               v_CLC_SEQ_NO,
               v_IDX_INLZ_CFG_ID,
               v_IDX_MNT_ID,
               vValtId,
               vOprId,
               vCstId,
               sysdate);
            --处理指标计算明细表
            vGetArgDtlSQL := 'SELECT T2.IDX_CLC_ARG, T2.IDX_ECD, T2.IDX_CLC_ARG_TP ' ||
                             '  FROM RULE_INLZ_CFG_DTL T2 ' ||
                             ' WHERE T2.IDX_INLZ_CFG_ID = ''' ||
                             v_IDX_INLZ_CFG_ID || '''';
            OPEN curArgDtlData FOR vGetArgDtlSQL;
            LOOP
              FETCH curArgDtlData
                INTO v_dtl_IDX_CLC_ARG, v_dtl_IDX_ECD, v_dtl_IDX_CLC_ARG_TP;
              EXIT WHEN curArgDtlData%NOTFOUND;
              /**
                详情表 指标计算日期
                HE：最新年报金额，取历史数据截止年；
                LY：营业收入的上一期，迭代起始年到截止年时，当前年份-1
                TY:营业收入的上二期，当前年份-2
                HY:营业收入的上三期，当前年份-3
                FY:营业收入的上四期，当前年份-4
                VD:估值日期
                NE:预测起始年
                LE:预测截止年
              */
              IF v_dtl_IDX_CLC_ARG_TP = 'HE' THEN
                v_dtl_IDX_DT := vHisEndYear || '1231';
              ELSIF v_dtl_IDX_CLC_ARG_TP = 'LY' THEN
                v_dtl_IDX_DT := (vCurYear - 1) || '1231';
              ELSIF v_dtl_IDX_CLC_ARG_TP = 'TY' THEN
                v_dtl_IDX_DT := (vCurYear - 2) || '1231';
              ELSIF v_dtl_IDX_CLC_ARG_TP = 'HY' THEN
                v_dtl_IDX_DT := (vCurYear - 3) || '1231';
              ELSIF v_dtl_IDX_CLC_ARG_TP = 'FY' THEN
                v_dtl_IDX_DT := (vCurYear - 4) || '1231';
              ELSIF v_dtl_IDX_CLC_ARG_TP = 'VD' THEN
                v_dtl_IDX_DT := vParaDt;
              ELSIF v_dtl_IDX_CLC_ARG_TP = 'NE' THEN
                v_dtl_IDX_DT := vPreStartYear || '1231';
              ELSIF v_dtl_IDX_CLC_ARG_TP = 'LE' THEN
                v_dtl_IDX_DT := vPreStartYear + vPreNum - 1 || '1231';
              ELSE
                v_dtl_IDX_DT := vCurYear || '1231';
              END IF;
              --插入指标计算明细表
              insert into IDX_CLC_DTL
                (IDX_CLCID, IDX_CLC_ARG, IDX_ECD, IDX_DT)
              values
                (v_IDX_CLCID,
                 v_dtl_IDX_CLC_ARG,
                 v_dtl_IDX_ECD,
                 to_date(v_dtl_IDX_DT, 'yyyyMMdd'));

            END LOOP;
            CLOSE curArgDtlData;

            vCurYear := vCurYear + 1;
          END;
        END LOOP;

      END LOOP;
      CLOSE curArgData;
      COMMIT;
      proc_clc_log(vValtId,
                   'p_valt_common_indexcal',
                   '2.预测期数编码处理成功',
                   'INFO');
    ELSE
      proc_clc_log(vValtId,
                   'p_valt_common_indexcal',
                   '2.入参无预测数据起始年、预测年数，已跳过',
                   'INFO');
    END IF;
    --2.END

    IF vRcmmScmEcd = 'X' THEN
      --3、处理估值期数编码：04按估值日期插入一条数据
      vWhereSql := ' AND T.VALT_PRD_NUM_ECD = ''04'' ';
      --拼接sql
      vGetArgSQL := vStartSql || vWhereSql || vEndSql;
      OPEN curArgData FOR vGetArgSQL;
      LOOP
        FETCH curArgData
          INTO v_IDX_INLZ_CFG_ID,
               v_IDX_ECD,
               v_IDX_TPCD,
               v_IDX_NM,
               v_CLC_EXP_CNTNT,
               v_IDX_MNT_ID,
               v_IDX_VAL,
               v_CLC_GRPG_SN,
               v_CLC_SEQ_NO,
               v_HIST_PRD_NUM_ECD,
               v_FRCT_PRD_NUM_ECD,
               v_VALT_PRD_NUM_ECD;
        EXIT WHEN curArgData%NOTFOUND;
        --生成指标计算表ID
        v_IDX_CLCID := SEQ_IDX_CLC.NEXTVAL;
        --指标计算表日期 = 估值日期 （yyyyMMdd）
        v_IDX_DT := vParaDt;

        --插入指标计算表
        insert into IDX_CLC
          (IDX_CLCID,
           IDX_ECD,
           IDX_DT,
           CLC_EXP_CNTNT,
           IDX_VAL,
           CLC_GRPG_SN,
           CLC_SEQ_NO,
           IDX_INLZ_CFG_ID,
           FRCT_MTH_MNTID,
           VALT_ID,
           OPR_ID,
           CST_ID,
           CRT_TM)
        values
          (v_IDX_CLCID,
           v_IDX_ECD,
           to_date(v_IDX_DT, 'yyyyMMdd'),
           v_CLC_EXP_CNTNT,
           v_IDX_VAL,
           v_CLC_GRPG_SN,
           v_CLC_SEQ_NO,
           v_IDX_INLZ_CFG_ID,
           v_IDX_MNT_ID,
           vValtId,
           vOprId,
           vCstId,
           sysdate);
        --处理指标计算明细表
        vGetArgDtlSQL := 'SELECT T2.IDX_CLC_ARG, T2.IDX_ECD, T2.IDX_CLC_ARG_TP ' ||
                         '  FROM RULE_INLZ_CFG_DTL T2 ' ||
                         ' WHERE T2.IDX_INLZ_CFG_ID = ''' ||
                         v_IDX_INLZ_CFG_ID || '''';
        OPEN curArgDtlData FOR vGetArgDtlSQL;
        LOOP
          FETCH curArgDtlData
            INTO v_dtl_IDX_CLC_ARG, v_dtl_IDX_ECD, v_dtl_IDX_CLC_ARG_TP;
          EXIT WHEN curArgDtlData%NOTFOUND;
          /**
            详情表 默认：指标日期 = 估值日期（yyyyMMdd）
            HE：最新年报金额，取历史数据截止年；
            LY：营业收入的上一期  估值年份-1 || '1231'
            TY:营业收入的上二期  估值年份-2 || '1231'
            HY:营业收入的上三期 估值年份-3 || '1231'
            FY:营业收入的上四期 估值年份-4 || '1231'
            NE:预测起始年
            LE:预测截止年
          */
          vCurYear := to_number(substr(vParaDt, 0, 4));
          IF v_dtl_IDX_CLC_ARG_TP = 'HE' THEN
            v_dtl_IDX_DT := vHisEndYear || '1231';
          ELSIF v_dtl_IDX_CLC_ARG_TP = 'LY' THEN
            v_dtl_IDX_DT := (vCurYear - 1) || '1231';
          ELSIF v_dtl_IDX_CLC_ARG_TP = 'TY' THEN
            v_dtl_IDX_DT := (vCurYear - 2) || '1231';
          ELSIF v_dtl_IDX_CLC_ARG_TP = 'HY' THEN
            v_dtl_IDX_DT := (vCurYear - 3) || '1231';
          ELSIF v_dtl_IDX_CLC_ARG_TP = 'FY' THEN
            v_dtl_IDX_DT := (vCurYear - 4) || '1231';
          ELSIF v_dtl_IDX_CLC_ARG_TP = 'NE' THEN
            v_dtl_IDX_DT := vPreStartYear || '1231';
          ELSIF v_dtl_IDX_CLC_ARG_TP = 'LE' THEN
            v_dtl_IDX_DT := vPreStartYear + vPreNum - 1 || '1231';
          ELSE
            v_dtl_IDX_DT := vParaDt;
          END IF;
          --插入指标计算明细表
          insert into IDX_CLC_DTL
            (IDX_CLCID, IDX_CLC_ARG, IDX_ECD, IDX_DT)
          values
            (v_IDX_CLCID,
             v_dtl_IDX_CLC_ARG,
             v_dtl_IDX_ECD,
             to_date(v_dtl_IDX_DT, 'yyyyMMdd'));

        END LOOP;
        CLOSE curArgDtlData;

      END LOOP;
      CLOSE curArgData;
      COMMIT;
      proc_clc_log(vValtId,
                   'p_valt_common_indexcal',
                   '3.估值期数编码处理成功',
                   'INFO');
    ELSE
      proc_clc_log(vValtId,
                   'p_valt_common_indexcal',
                   '1.生成预计算数据，估值期数编码已跳过',
                   'INFO');
    END IF;
    --3.END

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_valt_common_indexcal异常信息: [' ||
                 SUBSTR(SQLERRM, 1, 300) || ']，报错行数：[' ||
                 DBMS_UTILITY.format_error_backtrace || ']' ||
                 vGetArgDtlSQL || '->' || v_IDX_CLCID || ',' ||
                 v_dtl_IDX_CLC_ARG || ',' || v_dtl_IDX_ECD || ',' ||
                 v_dtl_IDX_DT || ',' || vParaDt || ',' || vCurYear || ',' ||
                 vPreStartYear || ',' || vPreNum;
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_valt_common_indexcal', os_msg, 'ERROR');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_valt_common_indexcal;

  procedure proc_valt_clc(vValtId  in varchar2, -- 估值ID
                          vIdxTpcd in varchar2, -- 指标类型编码（多个时以逗号隔开）
                          vCstId   in varchar2, -- 客户编号
                          vOprId   in varchar2, -- 操作员编号
                          oi_flag  out pls_integer, -- 1  成功  0 错误
                          os_msg   out varchar2 -- 出错信息
                          ) as

    -- 定义变量
    vQueryIdxCondition VARCHAR2(4000);
    vQueryIdxSQL       VARCHAR2(4000);
    vDealCount         NUMBER(10) := 0;
    FETCH_SIZE         PLS_INTEGER := 1000;
    vIdxVal            VARCHAR2(1000);
    TYPE IDX_ECD is table of IDX_CLC.IDX_ECD%TYPE;
    TYPE IDX_DT is table of IDX_CLC.IDX_DT%TYPE;
    TYPE IDX_CLCID is table of IDX_CLC.IDX_CLCID%TYPE;
    TYPE CLC_EXP_CNTNT is table of IDX_CLC.CLC_EXP_CNTNT%TYPE;
    TYPE IDX_VAL is table of IDX_CLC.IDX_VAL%TYPE;
    TYPE FRCT_PRD_NUM_ECD is table of IDX_INLZ_CFG.FRCT_PRD_NUM_ECD%TYPE;
    TYPE VALT_PRD_NUM_ECD is table of IDX_INLZ_CFG.VALT_PRD_NUM_ECD%TYPE;
    TYPE HIST_PRD_NUM_ECD is table of IDX_INLZ_CFG.HIST_PRD_NUM_ECD%TYPE;
    vIdxEcdArr        IDX_ECD;
    vIdxDtArr         IDX_DT;
    vIdxClcidArr      IDX_CLCID;
    vClcExpCArr       CLC_EXP_CNTNT;
    vIdxValArr        IDX_VAL;
    vFrctPrdNumEcdArr FRCT_PRD_NUM_ECD;
    vValtPrdNumEcdArr VALT_PRD_NUM_ECD;
    vHistPrdNumEcdArr HIST_PRD_NUM_ECD;
    TYPE CURSOR_TYPE IS REF CURSOR;
    curData CURSOR_TYPE;

  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';

    --拼接条件,估值ID,指标类型编码
    vQueryIdxCondition := ' AND C.VALT_ID = ''' || vValtId ||
                          ''' AND G.IDX_TPCD IN (' || vIdxTpcd || ')';
    -- 查询该指标类型编码待处理数据
    vQueryIdxSQL := ' SELECT C.IDX_ECD,C.IDX_DT,C.IDX_CLCID,C.CLC_EXP_CNTNT,C.IDX_VAL, ' ||
                    CHR(10) ||
                    ' G.FRCT_PRD_NUM_ECD, G.VALT_PRD_NUM_ECD, G.HIST_PRD_NUM_ECD ' ||
                    CHR(10) || '   FROM IDX_CLC C, IDX_INLZ_CFG G' ||
                    CHR(10) ||
                    '  WHERE C.IDX_INLZ_CFG_ID = G.IDX_INLZ_CFG_ID ' ||
                    vQueryIdxCondition || CHR(10) ||
                   --'  ORDER BY C.IDX_DT, G.CLC_GRPG_SN, G.CLC_SEQ_NO';
                    '  ORDER BY G.CLC_GRPG_SN,C.IDX_DT,G.CLC_SEQ_NO,C.IDX_CLCID';
    --dbms_output.put_line(vQueryIdxSQL);
    OPEN curData FOR vQueryIdxSQL;
    LOOP
      FETCH curData BULK COLLECT
        INTO vIdxEcdArr,
             vIdxDtArr,
             vIdxClcidArr,
             vClcExpCArr,
             vIdxValArr,
             vFrctPrdNumEcdArr,
             vValtPrdNumEcdArr,
             vHistPrdNumEcdArr LIMIT FETCH_SIZE;
      EXIT WHEN vIdxEcdArr.COUNT = 0;

      FOR idx IN 1 .. vIdxEcdArr.COUNT LOOP
        --if vIdxEcdArr(idx) ='S_IS11' then
        --dbms_output.put_line('idx clc:[' || vIdxEcdArr(idx) || ']-[' ||
        --                     vIdxDtArr(idx) || ']');
        --end if;
        --调用指标计算函数
        vIdxVal := PKG_VALT.f_get_idx_val(vValtId,
                                          vIdxClcidArr(idx),
                                          vClcExpCArr(idx),
                                          vIdxValArr(idx));
        --if vIdxEcdArr(idx) ='S_IS11' then
        --dbms_output.put_line('idx rst:[' || vIdxEcdArr(idx) || ']-[' ||
        --                     vIdxVal || ']');
        --end if;
        --先删除结果表该指标数据(估值ID,日期,指标编码确定唯一)
        DELETE FROM SBJ_AND_IDX_CLC_RSLT
         WHERE IDX_ECD = vIdxEcdArr(idx)
           AND IDX_DT = vIdxDtArr(idx)
           AND VALT_ID = vValtId;
        --再往结果表插入计算指标值
        INSERT INTO SBJ_AND_IDX_CLC_RSLT
          (IDX_ECD,
           IDX_DT,
           IDX_VAL,
           IDX_CLCID,
           VALT_ID,
           CST_ID,
           DATA_TP_ECD,
           DATA_FMT,
           CRT_PSN_ID,
           CRT_TM,
           LAST_UDT_OPR_ID,
           MOD_TM,
           Idx_Dt_Tp_ECD)
          SELECT vIdxEcdArr(idx),
                 vIdxDtArr(idx),
                 case
                   when A.DATA_TP_ECD = '01' and instr(vIdxVal, '.') > 0 then
                    to_char(vIdxVal, 'FM99999999999990.000099999999')
                   when A.DATA_TP_ECD = '05' then
                    to_char(vIdxVal, 'FM99999999999990.000099999999')
                   when A.DATA_TP_ECD = '02' then
                    to_char(vIdxVal, 'FM99999999999990.000099999999')
                   else
                    vIdxVal
                 end vIdxVal,
                 vIdxClcidArr(idx),
                 vValtId,
                 vCstId,
                 A.DATA_TP_ECD,
                 A.DATA_FMT,
                 vOprId,
                 SYSDATE,
                 vOprId,
                 SYSDATE,
                 case
                   when vFrctPrdNumEcdArr(idx) = '03' then
                    '01'
                   when vValtPrdNumEcdArr(idx) = '04' then
                    '02'
                   when vHistPrdNumEcdArr(idx) in ('02', '03') then
                    '03'
                   else
                    null
                 end
            from IDX_DEF A
           where A.IDX_ECD = vIdxEcdArr(idx);
        vDealCount := vDealCount + 1;
      END LOOP;
      COMMIT;

    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_valt_clc异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_valt_clc', os_msg, 'ERROR');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_valt_clc;

  procedure proc_inlz_mnt_idx(vValtId in varchar2, -- 估值ID
                              vLstDt  in Date, -- 历史最近一期
                              vIdyTp  in varchar2, --行业类别
                              vCstId  in varchar2, -- 客户编号
                              vOprId  in varchar2, -- 操作员编号
                              oi_flag out pls_integer, -- 1  成功  0 错误
                              os_msg  out varchar2 -- 出错信息
                              ) as
    /*
     功能: 初始化维护指标
             1、将指标初始化配置表数据拷贝到[指标维护表]
             2、[预测起始年]指标O_P97在维护表中默认为历史截止年+1
             3、行业推荐调整维护表预测方法
             4、问卷结果调整预测方法

     创建人: 林逸超
    */
    vRptCnt     pls_integer;
    vSql        varchar2(4000);
    vNum        number;
    vIdyTp_2    varchar(10);
    vIdyTp_temp varchar(10);
  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';
    --将指标初始化配置表数据拷贝到指标维护表
    MERGE INTO IDX_MNT A
    USING (SELECT IIC.IDX_ECD,
                  IIC.SLCT_FRCT_MTH_ECD,
                  IIC.IDX_DFALT_VAL,
                  IIC.IDX_DFALT_UPLM,
                  IIC.IDX_DFALT_LWRLMT,
                  IIC.IDX_TPCD
             FROM IDX_INLZ_CFG IIC
            WHERE IIC.DFALT_SLCT = 'Y') B
    ON (A.IDX_ECD = B.IDX_ECD AND A.VALT_ID = vValtId)
    WHEN MATCHED THEN
      UPDATE
         SET A.SLCT_FRCT_MTH_ECD = B.SLCT_FRCT_MTH_ECD,
             A.IDX_REF_VAL       = B.IDX_DFALT_VAL,
             A.IDX_RCMM_UPLM     = B.IDX_DFALT_UPLM,
             A.IDX_RCMM_LWRLMT   = B.IDX_DFALT_LWRLMT,
             A.IDX_TPCD          = B.IDX_TPCD,
             A.MOD_TM            = SYSDATE
    WHEN NOT MATCHED THEN
      INSERT
        (IDX_MNT_ID,
         IDX_ECD,
         SLCT_FRCT_MTH_ECD,
         IDX_REF_VAL,
         IDX_RCMM_UPLM,
         IDX_RCMM_LWRLMT,
         CST_ID,
         VALT_ID,
         CRT_PSN_ID,
         CRT_TM,
         LAST_UDT_OPR_ID,
         MOD_TM,
         IDX_TPCD)
      VALUES
        (SEQ_IDX_MNT.NEXTVAL,
         B.IDX_ECD,
         B.SLCT_FRCT_MTH_ECD,
         B.IDX_DFALT_VAL,
         B.IDX_DFALT_UPLM,
         B.IDX_DFALT_LWRLMT,
         vCstId,
         vValtId,
         vOprId,
         SYSDATE,
         vOprId,
         SYSDATE,
         B.IDX_TPCD);
    commit;
    --指标维护表O_P97预测起始年，指标参考值与指标值，均默认为历史截止年+1
    select count(1) into vNum from IDX_MNT where VALT_ID = vValtId;
    dbms_output.put_line('IDX_MNT->vNum->' || vNum);
    UPDATE IDX_MNT
       SET IDX_REF_VAL =
           (to_number(to_char(vLstDt, 'yyyy')) + 1) || '',
           IDX_VAL    =
           (to_number(to_char(vLstDt, 'yyyy')) + 1) || ''
     WHERE VALT_ID = vValtId
       AND IDX_ECD = 'O_P97';
    commit;
    select count(1)
      into vRptCnt
      from T_FA_CST_FNC_INF_IMPR i
     where i.FNC_ANL_ASES_RPT_ID = vValtId;
    if vRptCnt > 1 then
      vRptCnt := 9;
    else
      vRptCnt := 1;
    end if;
    dbms_output.put_line('IDX_MNT->vIdyTp->' || vIdyTp || ',vRptCnt->' ||
                         vRptCnt);
    if length(vIdyTp) >= 2 then
      vIdyTp_2 := substr(vIdyTp, 0, 1);
    else
      vIdyTp_2 := vIdyTp;
    end if;
    if vIdyTp_2 = 'C' then
      if length(vIdyTp) >= 3 then
        vIdyTp_temp := substr(vIdyTp, 0, 3);
      else
        vIdyTp_temp := vIdyTp;
      end if;
    else
      vIdyTp_temp := vIdyTp_2;
    end if;
    -- 行业推荐调整维护表预测方法
    merge into idx_mnt m
    using t_fa_idy_slct_mth s
    on (m.idx_ecd = s.idx_ecd and m.valt_id = vValtId and s.cd_val = vIdyTp_temp and s.UDT_FRQ = vRptCnt)
    when matched then
      update set m.slct_frct_mth_ecd = s.cd_ecd, m.mod_tm = sysdate;
    commit;
    -- 问卷结果调整预测方法
    vSql := 'update idx_mnt m
               set m.slct_frct_mth_ecd = :1,
                   m.mod_tm = sysdate
             where m.valt_id = :2
               and m.idx_ecd = :3
               and exists (select 1
                      from t_fa_valt_survey s
                     where trim(s.intlg_valt_id) = :4
                       and s.idx_ecd = :5
                       and s.tx_tp_idx_val = :6)';
    /**
    题库    选项描述                          选项值                              预测方法              指标
    QN01  企业所在发展生命周期       初创期  1                                  12 比率=10%            P_IS3
    QN04  应收账款账龄状况           账龄在一年以内的应收账款占比60%-80%  2     13  比率=减值率低      P_IS10
    QN04  应收账款账龄状况           账龄在一年以内的应收账款占比60%以下  3     14  比率=减值率高      P_IS10
    **/
    /****/
    execute immediate vSql
      using '12', vValtId, 'P_IS3', vValtId, 'QN01', '1';

    execute immediate vSql
      using '13', vValtId, 'P_IS10', vValtId, 'QN04', '2';

    execute immediate vSql
      using '14', vValtId, 'P_IS10', vValtId, 'QN04', '3';
    execute immediate vSql
      using '04', vValtId, 'P_IS24', vValtId, 'QN03', '1';
    execute immediate vSql
      using '07', vValtId, 'P_IS24', vValtId, 'QN03', '3';
    COMMIT;

    vSql := 'merge into idx_mnt m
              using (select idx_ecd, valt_id, idx_val
                       from sbj_and_idx_clc_rslt r
                      where r.valt_id = :1
                        and r.idx_dt = :2
                        and r.idx_ecd = :3) s
              on (m.valt_id = s.valt_id and m.idx_ecd = s.idx_ecd)
              when matched then
                update
                   set m.slct_frct_mth_ecd = case
                                               when s.idx_val is null or s.idx_val = 0 then
                                                :4
                                               else
                                                m.slct_frct_mth_ecd
                                             end';
    execute immediate vSql
        using vValtId, vLstDt, 'P_IS3', '12';
    execute immediate vSql
        using vValtId, vLstDt, 'O_P213', '08';
    COMMIT;

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_inlz_mnt_idx异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --异常信息打印并插入日志表
      PKG_VALT.proc_clc_log(vValtId, 'proc_inlz_mnt_idx', os_msg, 'ERROR');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_inlz_mnt_idx;

  procedure proc_adj_mnt_idx(vValtId       in varchar2, -- 估值ID
                             vParaDt       in varchar2, -- 估值日期（yyyyMMdd格式）
                             vLstDt        in Date, -- 历史最近一期
                             vHisStartYear in number, -- 历史数据始于(年) 如：2016
                             vHisEndYear   in number, -- 历史数据止于(年) 如：2018
                             vPreStartYear in number, -- 预测数据始于(年) 如：2019
                             vIdyTpSupr    in varchar2, -- 行业类别
                             vCstId        in varchar2, -- 客户编号
                             vOprId        in varchar2, -- 操作员编号
                             oi_flag       out pls_integer, -- 1  成功  0 错误
                             os_msg        out varchar2 -- 出错信息
                             ) as

  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';

    -- 根据结果表，更新指标维护表的[指标参考值]
    MERGE INTO IDX_MNT M
    USING (SELECT R.IDX_VAL, C.FRCT_MTH_MNTID
             FROM SBJ_AND_IDX_CLC_RSLT R, IDX_CLC C
            WHERE R.IDX_CLCID = C.IDX_CLCID
              AND R.VALT_ID = vValtId
              AND (R.IDX_DT = vLstDt OR
                  R.IDX_DT = TO_DATE(vParaDt, 'yyyyMMdd'))
              AND C.FRCT_MTH_MNTID IS NOT NULL) R
    ON (M.IDX_MNT_ID = R.FRCT_MTH_MNTID)
    WHEN MATCHED THEN
      UPDATE SET M.IDX_REF_VAL = R.IDX_VAL, M.MOD_TM = SYSDATE;
    COMMIT;

    --被选择的方法为【金额=0】或预测期开始年，页面无需展示参考值，直接初始化到指标值
    --【金额=0】 指标值应为0
    UPDATE IDX_MNT M
       SET M.IDX_VAL = case
                         when M.SLCT_FRCT_MTH_ECD = '07' then
                          '0'
                         else
                          M.IDX_REF_VAL
                       end,
           M.IDX_REF_VAL = NULL,
           M.MOD_TM      = SYSDATE
     WHERE (M.SLCT_FRCT_MTH_ECD = '07' OR M.IDX_ECD = 'O_P97')
       AND M.VALT_ID = vValtId;
    COMMIT;

    --将集成接口1调用完时维护表数据备份至历史表 1_END
    INSERT INTO IDX_MNT_HIS
      (IDX_MNT_ID,
       IDX_ECD,
       SLCT_FRCT_MTH_ECD,
       IDX_VAL,
       IDX_RCMM_UPLM,
       IDX_RCMM_LWRLMT,
       CST_ID,
       VALT_ID,
       CRT_PSN_ID,
       CRT_TM,
       LAST_UDT_OPR_ID,
       MOD_TM,
       IDX_TPCD,
       IDX_REF_VAL,
       CRT_NODE)
      SELECT IDX_MNT_ID,
             IDX_ECD,
             SLCT_FRCT_MTH_ECD,
             IDX_VAL,
             IDX_RCMM_UPLM,
             IDX_RCMM_LWRLMT,
             CST_ID,
             VALT_ID,
             CRT_PSN_ID,
             CRT_TM,
             LAST_UDT_OPR_ID,
             MOD_TM,
             IDX_TPCD,
             IDX_REF_VAL,
             '1_END'
        FROM IDX_MNT
       WHERE VALT_ID = vValtId;

  EXCEPTION
    WHEN OTHERS THEN
      oi_flag := 0;
      os_msg  := 'proc_adj_mnt_idx异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_adj_mnt_idx', os_msg, 'ERROR');
      --RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_adj_mnt_idx;

  procedure proc_mnt_aflt_idx_val(vValtId in varchar2, -- 估值ID
                                  vCstId  in varchar2, -- 客户编号
                                  vOprId  in varchar2, -- 操作员编号
                                  oi_flag out pls_integer, -- 1  成功  0 错误
                                  os_msg  out varchar2 -- 出错信息
                                  ) as
    /*
     功能:页面调整主指标编码的值，且[被选中的预测方法编码]为自定义02时，
          此指标值实际意义为其附属编码的指标值，
          故此处需要新增/更新对应的附属指标编码的值。
     创建人: 桂鹏飞
    */
    vRet varchar2(100);
    vLstYmr varchar2(100);
  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';

    MERGE INTO IDX_MNT A
    USING (SELECT T2.IDX_INLZ_CFG_ID,
                  T2.IDX_ECD,
                  T2.AFLT_IDX_ECD,
                  M2.SLCT_FRCT_MTH_ECD,
                  M2.IDX_VAL,
                  T2.IDX_DFALT_UPLM,
                  T2.IDX_DFALT_LWRLMT
             FROM IDX_INLZ_CFG T2
            INNER JOIN IDX_MNT M2
               ON T2.AFLT_IDX_ECD = M2.IDX_ECD
              AND T2.SLCT_FRCT_MTH_ECD = M2.SLCT_FRCT_MTH_ECD
              AND T2.SLCT_FRCT_MTH_ECD = '02'
              AND M2.VALT_ID = vValtId) B
    ON (A.IDX_ECD = B.IDX_ECD AND A.SLCT_FRCT_MTH_ECD = '02' AND A.VALT_ID = vValtId)
    WHEN MATCHED THEN
      UPDATE
         SET A.IDX_VAL         = B.IDX_VAL,
             A.IDX_RCMM_UPLM   = B.IDX_DFALT_UPLM,
             A.IDX_RCMM_LWRLMT = B.IDX_DFALT_LWRLMT,
             A.MOD_TM          = SYSDATE
    WHEN NOT MATCHED THEN
      INSERT
        (IDX_MNT_ID,
         IDX_ECD,
         SLCT_FRCT_MTH_ECD,
         IDX_VAL,
         IDX_RCMM_UPLM,
         IDX_RCMM_LWRLMT,
         CST_ID,
         VALT_ID,
         CRT_PSN_ID,
         CRT_TM,
         LAST_UDT_OPR_ID,
         MOD_TM)
      VALUES
        (SEQ_IDX_MNT.NEXTVAL,
         B.IDX_ECD,
         B.SLCT_FRCT_MTH_ECD,
         B.IDX_VAL,
         B.IDX_DFALT_UPLM,
         B.IDX_DFALT_LWRLMT,
         vCstId,
         vValtId,
         vOprId,
         SYSDATE,
         vOprId,
         SYSDATE);

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_mnt_aflt_idx_val异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_mnt_aflt_idx_val', os_msg, 'ERROR');
      commit;
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_mnt_aflt_idx_val;

  procedure proc_clc_log(vValtId in varchar2, -- 估值ID
                         procNm  in varchar2, --当前调用的程序名
                         logInf  in varchar2, --日志信息
                         logLvl  in varchar2 --日志级别：ERROR、WARN、INFO
                         ) as
    /*
     功能: 异常或运行信息打印并插入日志表
     创建人: 桂鹏飞
    */
  BEGIN
    --打印日志信息
    --DBMS_OUTPUT.PUT_LINE(logInf);
    --插入日志表
    INSERT INTO IDX_CLC_LOG
      (VALT_ID, PROC_NM, LOG_INF, LOG_LVL, CRT_TM)
    VALUES
      (vValtId, procNm, logInf, logLvl, SYSDATE);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      --DBMS_OUTPUT.PUT_LINE('proc_clc_log异常信息: [' ||
    --                     SUBSTR(SQLERRM, 1, 300) || ']');
  END proc_clc_log;

  procedure proc_valt_rcrd(vValtId   in varchar2, -- 估值ID
                           procNm    in varchar2, -- 当前调用的接口
                           wthrCompl in varchar2 -- 开始0，结束1
                           ) as
  BEGIN
    IF procNm = '1' THEN
      UPDATE VALT_RCRD
         SET WTHR_COMPL_INLZ = wthrCompl
       WHERE VALT_ID = vValtId;
    ELSIF procNm = '2' THEN
      UPDATE VALT_RCRD
         SET WTHR_COMPL_CLC = wthrCompl
       WHERE VALT_ID = vValtId;
    END IF;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      --DBMS_OUTPUT.PUT_LINE('proc_valt_rcrd Error: [' ||
    --                     SUBSTR(SQLERRM, 1, 300) || ']');
  END proc_valt_rcrd;

  procedure proc_frct_ratnl_tst(vValtId in varchar2 -- 估值ID
                                ) as
    /*
     功能: 保存预测合理性检验结果存储过程
     创建人: 林逸超
    */
  BEGIN
    INSERT INTO FRCT_RATNL_TST_RSLT
      (VALT_ID, IDX_ECD, TST_RSLT)
      WITH T AS
       (select pkg_valt.f_frct_ratnl_tst(vValtId, idx_ecd) idx_ecd
          from IDX_INLZ_CFG a
         where a.IDX_TPCD = '13'
         order by idx_ecd)
      select vValtId,
             substr(T.idx_ecd, 0, length(T.idx_ecd) - 4),
             REPLACE(A.IDX_DSC,
                     'x',
                     to_char(C.IDX_VAL * 100, 'FM99999999999990.00'))
        from T
        left join IDX_DEF A
          on T.idx_ecd = A.idx_ecd
        left join SBJ_AND_IDX_CLC_RSLT C
          on C.IDX_ECD = substr(T.idx_ecd, 0, length(T.idx_ecd) - 1) || '9'
         and C.Valt_Id = vValtId
       where T.idx_ecd is not null;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      --DBMS_OUTPUT.PUT_LINE('proc_frct_ratnl_tst异常信息: [' ||
    --                     SUBSTR(SQLERRM, 1, 300) || ']');
  END proc_frct_ratnl_tst;

  FUNCTION f_get_idx_val(vValtId      SBJ_AND_IDX_CLC_RSLT.VALT_ID%TYPE, -- 估值ID
                         vIdxClcId    IDX_CLC.Idx_Clcid%TYPE, -- 指标计算主表ID
                         vClcExpCntnt IDX_CLC.CLC_EXP_CNTNT%TYPE, -- 指标计算表达式
                         vIdxVal      IDX_CLC.IDX_VAL%TYPE -- 指标默认值
                         ) RETURN VARCHAR2 AS
    vItemValue VARCHAR2(1000); -- 待计算指标结果
    vClcExp    VARCHAR2(4000); -- 指标计算公式
    vSQL       VARCHAR2(4000);
    vRSQL      VARCHAR2(4000);
    vGetArgSQL VARCHAR2(4000);

    TYPE CURSOR_TYPE IS REF CURSOR;
    curArgData CURSOR_TYPE;

    TYPE IDX_CLC_ARG is table of IDX_CLC_DTL.IDX_CLC_ARG%TYPE;
    TYPE IDX_VAL is table of SBJ_AND_IDX_CLC_RSLT.IDX_VAL%TYPE;
    vIdxClcArgArr IDX_CLC_ARG;
    vIdxValArr    IDX_VAL;

    TEMP_IDX_DT  Date;
    TEMP_IDX_ECD varchar2(30);
    os_msg       VARCHAR2(1000);
  BEGIN
    if vClcExpCntnt is null then
      IF vIdxVal IS NULL THEN
        RETURN NULL;
      END IF;
      -- 指标值 = 指标默认值
      vItemValue := vIdxVal;
    else
      vClcExp := '''' || vClcExpCntnt || '''';
    end if;

    IF vIdxVal IS NOT NULL THEN
      RETURN vIdxVal;
    END IF;
    /*
      功能：替换计算公式里计算变量为对应指标值：
      注意： _PV结尾的，替换为指标编码（去调用别的函数使用）
            Date_VD结尾，需替换为to_date('指标值','yyyyMMdd')
            其余的替换为指标值
    */
    vGetArgSQL := '  SELECT D.IDX_CLC_ARG, ' ||
                  '      CASE WHEN D.IDX_CLC_ARG LIKE ''%_PV'' THEN D.IDX_ECD ' ||
                  '             ELSE R.IDX_VAL END ' ||
                  ' FROM IDX_CLC_DTL D ' ||
                  ' LEFT JOIN SBJ_AND_IDX_CLC_RSLT R ' ||
                  '   ON D.IDX_ECD = R.IDX_ECD ' ||
                  '  AND D.IDX_DT = R.IDX_DT ' ||
                  '  AND R.VALT_ID = :vValtId' ||
                  ' WHERE D.IDX_CLCID = :vIdxClcId';
    -- 取指标变量及变量值
    OPEN curArgData FOR vGetArgSQL
      USING vValtId, vIdxClcId;
    LOOP
      FETCH curArgData BULK COLLECT
        INTO vIdxClcArgArr, vIdxValArr;
      EXIT WHEN vIdxClcArgArr.COUNT = 0;

      FOR i IN 1 .. vIdxClcArgArr.COUNT LOOP
        --Date_VD结尾，替换为to_date('指标值','yyyyMMdd')
        IF vIdxClcArgArr(i) LIKE '%_Date_VD' THEN
          vClcExp := 'REPLACE(' || vClcExp || ', ''[' || vIdxClcArgArr(i) ||
                     ']'', ''to_date(''''' || vIdxValArr(i) ||
                     ''''',''''yyyyMMdd'''')'')';
        ELSIF vIdxValArr(i) IS NULL THEN
          vClcExp := 'REPLACE(' || vClcExp || ', ''[' || vIdxClcArgArr(i) ||
                     ']'', ''' || 'null' || ''')';
        ELSE
          vClcExp := 'REPLACE(' || vClcExp || ', ''[' || vIdxClcArgArr(i) ||
                     ']'', ''' || vIdxValArr(i) || ''')';
        END IF;

      -- dbms_output.put_line(vIdxClcArgArr(i) ||' = '|| vIdxValArr(i));
      END LOOP;

      --替换公式中的vValtId为估值ID的值
      vClcExp := 'REPLACE(' || vClcExp || ', ''' || 'vValtId' || ''', ''' ||
                 vValtId || ''')';
      --替换公式中的vIdxClcId为指标计算主表ID值
      vClcExp := 'REPLACE(' || vClcExp || ', ''' || 'vIdxClcId' || ''', ''' ||
                 vIdxClcId || ''')';
      --替换公式中的nYear为PKG_VALT.f_nyear('指标计算主表ID值')
      vClcExp := 'REPLACE(' || vClcExp || ', ''' || 'nYear' ||
                 ''', ''PKG_VALT.f_nyear(''''' || vIdxClcId || ''''')'')';

      vSQL := 'SELECT ' || vClcExp || ' FROM DUAL';
      --dbms_output.put_line('replaced expression.--> ' || vSQL);
      EXECUTE IMMEDIATE vSQL
        INTO vRSQL;

    END LOOP;

    IF vRSQL IS NULL THEN
      vItemValue := NULL;
    ELSIF (INSTR(vRSQL, '[') > 0 OR INSTR(vRSQL, ']') > 0) and
          INSTR(vRSQL, 'f_avg') <= 0 THEN
      vItemValue := NULL;
      select c.idx_dt, c.idx_ecd
        into TEMP_IDX_DT, TEMP_IDX_ECD
        from idx_clc c
       where c.idx_clcid = vIdxClcId;
      --dbms_output.put_line('Exception expression start ***************');
      --dbms_output.put_line('[' || TEMP_IDX_ECD || '] - [' ||
      --                     to_char(TEMP_IDX_DT, 'yyyyMMdd') || ']');
      --dbms_output.put_line(vClcExpCntnt);
      --dbms_output.put_line(vRSQL);
      --dbms_output.put_line('Exception expression end ***************');
    ELSE
      vRSQL := REPLACE(vRSQL, '--', '+');
      vSQL  := 'SELECT ' || vRSQL || ' FROM DUAL';
      --dbms_output.put_line('result SQL.--> ' || vSQL);
      EXECUTE IMMEDIATE vSQL
        INTO vItemValue;
      --dbms_output.put_line('[' ||vClcExpCntnt|| '] = '|| vItemValue);
    END IF;

    RETURN vItemValue;

  EXCEPTION
    WHEN OTHERS THEN
      os_msg := 'f_get_idx_val异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --DBMS_OUTPUT.PUT_LINE(os_msg);
      --函数异常返回null不抛出异常，继续执行
      RETURN NULL;
  END f_get_idx_val;

  FUNCTION f_avg(vVal in varchar2) RETURN NUMBER AS
    /*
     功能: 求平均数  传入数字使用逗号拼接成字符串,例:'1,2,3'
           入参为null，或入参公式出现除数为0异常时，此参数不计入基数
           f_avg('1/0,null,,1,2') -> 1.5
     创建人: 林逸超
    */
    vAvg   VARCHAR2(30) := 0; --avg平均值
    vSQL   VARCHAR2(4000);
    vSum   NUMBER := 0;
    vTemp  NUMBER := 0;
    vNum   NUMBER := 0;
    os_msg varchar2(1000);
  BEGIN
    vAvg := 0;
    --传入参数，如果是公式且出现分母为0异常时，按NULL处理
    FOR item IN (SELECT str
                   FROM (SELECT PKG_VALT.ERROR_TO_NULL(REGEXP_SUBSTR('' || vVal || '',
                                                                     '[^,]+',
                                                                     1,
                                                                     ROWNUM)) str
                           FROM DUAL
                         CONNECT BY ROWNUM <=
                                    LENGTH('' || vVal || '') -
                                    LENGTH(REGEXP_REPLACE('' || vVal || '',
                                                          ',',
                                                          '')) + 1)
                  WHERE str IS NOT NULL) LOOP
      vSQL := 'SELECT ' || item.str || ' FROM DUAL';
      --dbms_output.put_line('f_avg SQL.--> ' || vSQL);
      IF INSTR(item.str, '[') <= 0 AND INSTR(item.str, ']') <= 0 THEN
        EXECUTE IMMEDIATE vSQL
          INTO vTemp;
        IF vTemp IS NOT NULL THEN
          vSum := vSum + vTemp;
          vNum := vNum + 1;
        END IF;
      END IF;
    END LOOP;
    IF vSum IS NULL THEN
      --dbms_output.put_line('f_avg调用异常：vSum为空');
      return '0';
    END IF;
    --三个参数均为null时，返回结果0
    IF vNum = 0 THEN
      return '0';
    END IF;
    vSQL := 'SELECT to_char(' || vSum / vNum ||
            ', ''FM99999999999990.000099999999'') FROM DUAL';
    EXECUTE IMMEDIATE vSQL
      INTO vAvg;
    RETURN vAvg;
  EXCEPTION
    WHEN OTHERS THEN
      os_msg := 'f_avg异常信息: [' || SUBSTR(SQLERRM, 1, 300) || ']，报错行数：[' ||
                DBMS_UTILITY.format_error_backtrace || ']';
      --DBMS_OUTPUT.PUT_LINE(os_msg);
      --函数异常返回null不抛出异常，继续执行
      RETURN NULL;
  END f_avg;

  FUNCTION f_npv(vRate    in number, --利率值
                 vIdxEcd2 in varchar2, --收益指标编码
                 vValtId  in varchar2 -- 估值ID
                 ) return NUMBER is
    /*

     功    能: 传入利率值、收益指标编码,返回npv值

     创 建 人: 林逸超

    */
    vNpv       NUMBER; --npv值
    vStartYear VARCHAR2(10);
    vEndYear   VARCHAR2(10);
    totalYear  NUMBER := 0;
    vGetArgSQL VARCHAR2(4000);
    v_count    PLS_INTEGER := 0;
    TYPE CURSOR_TYPE IS REF CURSOR;
    curArgData CURSOR_TYPE;

    TYPE IDX_VAL is table of NUMBER;
    vIdxValArr IDX_VAL;
    os_msg     varchar2(1000);
  begin
    vNpv := 0;
    select count(1)
      into v_count
      from IDX_MNT
     where IDX_ECD = 'O_P97'
       and VALT_ID = vValtId;
    if v_count = 0 then
      return vNpv;
    end if;
    select count(1)
      into v_count
      from IDX_MNT
     where IDX_ECD = 'O_P96'
       and VALT_ID = vValtId;
    if v_count = 0 then
      return vNpv;
    end if;
    select to_char(add_months(TO_DATE(to_char(IDX_VAL, 'FM9999999990') ||
                                      '1231',
                                      'yyyymmdd'),
                              12),
                   'yyyymmdd')
      into vStartYear
      from IDX_MNT
     where IDX_ECD = 'O_P97'
       and VALT_ID = vValtId;
    select to_number(IDX_VAL)
      into totalYear
      from IDX_MNT
     where IDX_ECD = 'O_P96'
       and VALT_ID = vValtId;
    select to_char(add_months(TO_DATE(to_char(IDX_VAL, 'FM9999999990') ||
                                      '1231',
                                      'yyyymmdd'),
                              12 * totalYear),
                   'yyyymmdd')
      into vEndYear
      from IDX_MNT
     where IDX_ECD = 'O_P97'
       and VALT_ID = vValtId;

    -- dbms_output.put_line(vStartYear);

    vGetArgSQL := 'SELECT TO_NUMBER(B.IDX_VAL) IDX_VAL   ' ||
                  '  FROM SBJ_AND_IDX_CLC_RSLT B ' ||
                  ' WHERE B.IDX_DT >= TO_DATE(''' || vStartYear ||
                  ''',''yyyyMMdd'')' || '   AND B.IDX_DT <= TO_DATE(''' ||
                  vEndYear || ''',''yyyyMMdd'')' || '   AND B.VALT_ID = ''' ||
                  vValtId || ''' ' || '   AND B.IDX_ECD = ''' || vIdxEcd2 ||
                  ''' ' || ' ORDER BY B.IDX_DT ';
    -- dbms_output.put_line(vGetArgSQL);
    OPEN curArgData FOR vGetArgSQL;
    FETCH curArgData BULK COLLECT
      INTO vIdxValArr;
    -- dbms_output.put_line(vIdxValArr.COUNT);

    FOR i IN 1 .. vIdxValArr.COUNT LOOP
      EXIT WHEN vIdxValArr.COUNT = 0;
      -- dbms_output.put_line(vIdxValArr(i));

      vNpv := vNpv + vIdxValArr(i) / (power(vRate + 1, i));

    END LOOP;
    -- dbms_output.put_line(vNpv);

    return vNpv;
  EXCEPTION
    WHEN OTHERS THEN
      os_msg := 'f_npv异常信息: [' || SUBSTR(SQLERRM, 1, 300) || ']，报错行数：[' ||
                DBMS_UTILITY.format_error_backtrace || ']';
      --DBMS_OUTPUT.PUT_LINE(os_msg);
      --函数异常返回null不抛出异常，继续执行
      RETURN NULL;
  end f_npv;

  FUNCTION f_new_fixed_assets_val(vIdxClcId in varchar2, --指标计算主表ID
                                  vIdxEcd1  in varchar2, --投资额_指标编码
                                  vIdxEcd2  in varchar2 --建设期_指标编码
                                  ) RETURN NUMBER IS
    /*
     功    能: 获取[新增固定资产]指标值
     创 建 人: 桂鹏飞
    */
    vResultVal      number; --[新增固定资产]指标值
    vValtId         varchar2(240); --估值ID
    vIdxDt          varchar2(8); --指标日期 yyyyMMdd
    vIdxYear        number; --指标年份 yyyy
    vCurInvestYear  number; --当前数据投资年份
    vCurInvestAmt   number; --当前数据投资额
    vCurBuildPeriod number; --当前数据建设期
    --定义游标
    TYPE CURSOR_TYPE IS REF CURSOR;
    curArgData CURSOR_TYPE;
    vGetArgSQL VARCHAR2(4000);
    os_msg     varchar2(1000);

  BEGIN
    vResultVal := 0;
    dbms_output.put_line('vIdxClcId->'||vIdxClcId||';vIdxEcd1->'||vIdxEcd1||';vIdxEcd2->'||vIdxEcd2);
    --初始化指标日期、估值ID
    SELECT TO_CHAR(IC.IDX_DT, 'yyyyMMdd'),
           TO_NUMBER(TO_CHAR(IC.IDX_DT, 'yyyy')),
           IC.VALT_ID
      INTO vIdxDt, vIdxYear, vValtId
      FROM IDX_CLC IC
     WHERE IC.IDX_CLCID = vIdxClcId;

    --查询小于查询年的所有投资额、建设期，计算当年新增固定资产
    vGetArgSQL := ' SELECT TO_NUMBER(TO_CHAR(R1.IDX_DT, ''yyyy'')), ' ||
                  '        TO_NUMBER(NVL(R1.IDX_VAL, ''0'')),       ' ||
                  '        NVL((SELECT TO_NUMBER(NVL(R2.IDX_VAL, ''0''))   ' ||
                  '               FROM SBJ_AND_IDX_CLC_RSLT R2             ' ||
                  '              WHERE R2.IDX_ECD = ''' || vIdxEcd2 || '''' ||
                  '                AND R2.VALT_ID = R1.VALT_ID             ' ||
                  '                AND R2.IDX_DT = R1.IDX_DT     ' ||
                  '                AND ROWNUM =1),0)             ' ||
                  '   FROM SBJ_AND_IDX_CLC_RSLT R1                  ' ||
                  '  WHERE R1.IDX_ECD = ''' || vIdxEcd1 || '''' ||
                  '    AND R1.VALT_ID = ''' || vValtId || '''' ||
                  '    AND TO_CHAR(R1.IDX_DT,''MMdd'') = ''1231'' ' ||
                  '    AND R1.IDX_DT <= TO_DATE(''' || vIdxDt ||
                  ''', ''yyyyMMdd'') ' || '  ORDER BY R1.IDX_DT ';
    OPEN curArgData FOR vGetArgSQL;
    if vIdxEcd1='O_P19' then
    dbms_output.put_line('vGetArgSQL->'||vGetArgSQL);
    end if;
    LOOP
      FETCH curArgData
        INTO vCurInvestYear, vCurInvestAmt, vCurBuildPeriod;
      EXIT WHEN curArgData%NOTFOUND;
      --当前投资额年份 + 建设期 = 查询的年份，则累计
      IF vCurInvestYear + vCurBuildPeriod = vIdxYear THEN
        vResultVal := vResultVal + vCurInvestAmt;
      END IF;
    END LOOP;
    CLOSE curArgData;
    dbms_output.put_line('vResultVal->'||vResultVal);
    RETURN vResultVal;
  EXCEPTION
    WHEN OTHERS THEN
      os_msg := 'f_new_fixed_assets_val异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --DBMS_OUTPUT.PUT_LINE(os_msg);
      --函数异常返回null不抛出异常，继续执行
      RETURN NULL;
  END f_new_fixed_assets_val;

  FUNCTION f_under_build_project_val(vIdxClcId in varchar2, --指标计算主表ID
                                     vIdxEcd1  in varchar2, --投资额_指标编码
                                     vIdxEcd2  in varchar2 --建设期_指标编码
                                     ) RETURN NUMBER IS
    /*
     功    能: 获取[期末在建工程]指标值
     创 建 人: 桂鹏飞
    */
    vResultVal      number; --[期末在建工程]指标值
    vValtId         varchar2(240); --估值ID
    vIdxDt          varchar2(8); --指标日期 yyyyMMdd
    vIdxYear        number; --指标年份 yyyy
    vCurInvestYear  number; --当前数据投资年份
    vCurInvestAmt   number; --当前数据投资额
    vCurBuildPeriod number; --当前数据建设期
    --定义游标
    TYPE CURSOR_TYPE IS REF CURSOR;
    curArgData CURSOR_TYPE;
    vGetArgSQL VARCHAR2(4000);
    os_msg     varchar2(1000);

  BEGIN
    vResultVal := 0;
    --初始化指标日期、估值ID
    SELECT TO_CHAR(IC.IDX_DT, 'yyyyMMdd'),
           TO_NUMBER(TO_CHAR(IC.IDX_DT, 'yyyy')),
           IC.VALT_ID
      INTO vIdxDt, vIdxYear, vValtId
      FROM IDX_CLC IC
     WHERE IC.IDX_CLCID = vIdxClcId;

    --查询小于查询年的所有投资额、建设期，计算当年新增固定资产
    vGetArgSQL := ' SELECT TO_NUMBER(TO_CHAR(R1.IDX_DT, ''yyyy'')), ' ||
                  '        TO_NUMBER(NVL(R1.IDX_VAL, ''0'')),       ' ||
                  '        NVL((SELECT TO_NUMBER(NVL(R2.IDX_VAL, ''0''))   ' ||
                  '               FROM SBJ_AND_IDX_CLC_RSLT R2             ' ||
                  '              WHERE R2.IDX_ECD = ''' || vIdxEcd2 || '''' ||
                  '                AND R2.VALT_ID = R1.VALT_ID             ' ||
                  '                AND R2.IDX_DT = R1.IDX_DT     ' ||
                  '                AND ROWNUM =1),0)             ' ||
                  '   FROM SBJ_AND_IDX_CLC_RSLT R1                  ' ||
                  '  WHERE R1.IDX_ECD = ''' || vIdxEcd1 || '''' ||
                  '    AND R1.VALT_ID = ''' || vValtId || '''' ||
                  '    AND TO_CHAR(R1.IDX_DT,''MMdd'') = ''1231'' ' ||
                  '    AND R1.IDX_DT <= TO_DATE(''' || vIdxDt ||
                  ''', ''yyyyMMdd'') ' || '  ORDER BY R1.IDX_DT ';
    OPEN curArgData FOR vGetArgSQL;
    LOOP
      FETCH curArgData
        INTO vCurInvestYear, vCurInvestAmt, vCurBuildPeriod;
      EXIT WHEN curArgData%NOTFOUND;
      --当前投资额年份 + 建设期 > 查询的年份，则累计
      IF vCurInvestYear + vCurBuildPeriod > vIdxYear THEN
        vResultVal := vResultVal + vCurInvestAmt;
      END IF;
    END LOOP;
    CLOSE curArgData;

    RETURN vResultVal;
  EXCEPTION
    WHEN OTHERS THEN
      os_msg := 'f_new_fixed_assets_val异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --DBMS_OUTPUT.PUT_LINE(os_msg);
      --函数异常返回null不抛出异常，继续执行
      RETURN NULL;
  END f_under_build_project_val;

  FUNCTION f_current_depreciation_val(vIdxClcId in varchar2, --指标计算主表ID
                                      vIdxEcd1  in varchar2, --投资额_指标编码
                                      vIdxEcd2  in varchar2, --建设期_指标编码
                                      vIdxEcd3  in varchar2, --折旧年限_指标编码
                                      vIdxEcd4  in varchar2 --残值率_指标编码
                                      ) RETURN NUMBER IS
    /*
     功    能: 获取[当期计提折旧]指标值
     创 建 人: 桂鹏飞
    */
    vResultVal      number; --当期计提折旧指标值
    vValtId         varchar2(240); --估值ID
    vIdxDt          varchar2(8); --指标日期 yyyyMMdd
    vIdxYear        number; --指标年份 yyyy
    vOldYear        number; --折旧年限
    vSalRate        number; --残值率
    vCurYear        number; --当前循环处理的年份
    vCurInvestYear  number; --当前数据投资年份
    vCurInvestAmt   number; --当前数据投资额
    vCurBuildPeriod number; --当前数据建设期
    vPreStartYear   number; --预测数据开始年
    --定义游标
    TYPE CURSOR_TYPE IS REF CURSOR;
    curArgData CURSOR_TYPE;
    vGetArgSQL VARCHAR2(4000);
    v_count    PLS_INTEGER := 0;
    os_msg     varchar2(1000);

  BEGIN
    vResultVal := 0;
    --初始化指标日期、估值ID
    SELECT TO_CHAR(IC.IDX_DT, 'yyyyMMdd'),
           TO_NUMBER(TO_CHAR(IC.IDX_DT, 'yyyy')),
           IC.VALT_ID
      INTO vIdxDt, vIdxYear, vValtId
      FROM IDX_CLC IC
     WHERE IC.IDX_CLCID = vIdxClcId;

    --查询折旧年限（年）
    select count(1)
      into v_count
      from IDX_MNT
     where IDX_ECD = vIdxEcd3
       and VALT_ID = vValtId;
    IF v_count > 0 THEN
      select to_number(IDX_VAL)
        into vOldYear
        from IDX_MNT
       where IDX_ECD = vIdxEcd3
         and VALT_ID = vValtId;
    ELSE
      os_msg := 'f_new_fixed_assets - Error: [''未查询到折旧年限，无法计算'']';
      RAISE_APPLICATION_ERROR(-20100, os_msg);
    END IF;

    --查询预测数据始于(年)
    select count(1)
      into v_count
      from IDX_MNT
     where IDX_ECD = 'O_P97'
       and VALT_ID = vValtId;
    IF v_count > 0 THEN
      select to_number(IDX_VAL)
        into vPreStartYear
        from IDX_MNT
       where IDX_ECD = 'O_P97'
         and VALT_ID = vValtId;
    ELSE
      os_msg := 'f_new_fixed_assets - Error: [''未查询到O_P97预测开始年，无法计算'']';
      RAISE_APPLICATION_ERROR(-20100, os_msg);
    END IF;

    --查询残值率
    select count(1)
      into v_count
      from IDX_MNT
     where IDX_ECD = vIdxEcd4
       and VALT_ID = vValtId;
    IF v_count > 0 THEN
      select to_number(NVL(IDX_VAL, '0'))
        into vSalRate
        from IDX_MNT
       where IDX_ECD = vIdxEcd4
         and VALT_ID = vValtId;
    ELSE
      vSalRate := 0;
    END IF;

    /**
       如预测开始年为2019，查2021年的当前计提折旧，则
       当前计提折旧计提折旧 = 2019年新增固定资产 +
                             2020年新增固定资产资产 +
                             2021年新增固定资产
    */
    vCurYear := vPreStartYear;
    WHILE vCurYear <= vIdxYear LOOP
      BEGIN
        --查询小于查询年的所有投资额、建设期，计算当年新增固定资产
        vGetArgSQL := ' SELECT TO_NUMBER(TO_CHAR(R1.IDX_DT, ''yyyy'')), ' ||
                      '        TO_NUMBER(NVL(R1.IDX_VAL, ''0'')),       ' ||
                      '        NVL((SELECT TO_NUMBER(NVL(R2.IDX_VAL, ''0''))   ' ||
                      '               FROM SBJ_AND_IDX_CLC_RSLT R2             ' ||
                      '              WHERE R2.IDX_ECD = ''' || vIdxEcd2 || '''' ||
                      '                AND R2.VALT_ID = R1.VALT_ID             ' ||
                      '                AND R2.IDX_DT = R1.IDX_DT     ' ||
                      '                AND ROWNUM =1),0)             ' ||
                      '   FROM SBJ_AND_IDX_CLC_RSLT R1                  ' ||
                      '  WHERE R1.IDX_ECD = ''' || vIdxEcd1 || '''' ||
                      '    AND R1.VALT_ID = ''' || vValtId || '''' ||
                      '    AND TO_CHAR(R1.IDX_DT,''MMdd'') = ''1231'' ' ||
                      '    AND R1.IDX_DT <= TO_DATE(''' || vCurYear ||
                      '1231'', ''yyyyMMdd'') ' || '  ORDER BY R1.IDX_DT ';

        OPEN curArgData FOR vGetArgSQL;
        LOOP
          FETCH curArgData
            INTO vCurInvestYear, vCurInvestAmt, vCurBuildPeriod;
          EXIT WHEN curArgData%NOTFOUND;
          --当前投资额年份 + 建设期 = 查询的年份 且 折旧年份 >= 1，则累计
          IF vCurInvestYear + vCurBuildPeriod = vCurYear AND vOldYear >= 1 THEN
            vResultVal := vResultVal + (vCurInvestAmt -
                          vCurInvestAmt * vSalRate) / vOldYear;
          END IF;
        END LOOP;
        CLOSE curArgData;
        vCurYear := vCurYear + 1;
      END;
    END LOOP;

    RETURN ROUND(vResultVal, 2);
  EXCEPTION
    WHEN OTHERS THEN
      os_msg := 'f_new_fixed_assets_val异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --DBMS_OUTPUT.PUT_LINE(os_msg);
      --函数异常返回null不抛出异常，继续执行
      RETURN NULL;
  END f_current_depreciation_val;

  FUNCTION f_nyear(vIdxClcId in varchar2 --指标计算主表ID
                   ) RETURN NUMBER IS
    /*
     功    能: 当期待计算指标第n年
               1. 计算id 查计算表 指标日期年度
               2. nYear = 指标日期年度 减 预测开始年度 加 1年
               3. 替换表达式中的 [nYear]
     创 建 人: 桂鹏飞
    */
    vResultVal    number; --当期待计算指标第n年的值
    vValtId       varchar2(240); --估值ID
    vIdxYear      number; --指标年份 yyyy
    vPreStartYear number; --预测开始年度
    v_count       PLS_INTEGER := 0;
    os_msg        varchar2(1000);

  BEGIN
    --初始化指标日期、估值ID
    SELECT TO_NUMBER(TO_CHAR(IC.IDX_DT, 'yyyy')), IC.VALT_ID
      INTO vIdxYear, vValtId
      FROM IDX_CLC IC
     WHERE IC.IDX_CLCID = vIdxClcId;

    --查询预测数据始于(年)
    select count(1)
      into v_count
      from IDX_MNT
     where IDX_ECD = 'O_P97'
       and VALT_ID = vValtId;
    IF v_count > 0 THEN
      select to_number(IDX_VAL)
        into vPreStartYear
        from IDX_MNT
       where IDX_ECD = 'O_P97'
         and VALT_ID = vValtId;
    ELSE
      os_msg := '[f_nyear] - Error: [''未查询到预测开始年度，无法计算'']';
      RAISE_APPLICATION_ERROR(-20100, os_msg);
    END IF;

    vResultVal := vIdxYear - vPreStartYear + 1;
    RETURN vResultVal;
  EXCEPTION
    WHEN OTHERS THEN
      os_msg := 'f_nyear异常信息: [' || SUBSTR(SQLERRM, 1, 300) || ']，报错行数：[' ||
                DBMS_UTILITY.format_error_backtrace || ']';
      --DBMS_OUTPUT.PUT_LINE(os_msg);
      --函数异常返回null不抛出异常，继续执行
      RETURN NULL;
  END f_nyear;

  FUNCTION f_sum_pre_profit(vIdxClcId in varchar2, --指标计算主表ID
                            vIdxEcd1  in varchar2 --资产减值损失_指标编码
                            ) RETURN NUMBER IS
    /*
     功    能: 固定资产的公式中 SUM(预测利润表!$H20:J20)
             从预测起始年至指标计算年，该指标编码值的合计
     创 建 人: 桂鹏飞
    */
    vResultVal    number; --合计值
    vValtId       varchar2(240); --估值ID
    vIdxDt        varchar2(8); --指标日期 yyyyMMdd
    vPreStartYear number; --预测开始年度
    v_count       PLS_INTEGER := 0;
    os_msg        varchar2(1000);

  BEGIN
    --初始化指标日期、估值ID
    SELECT TO_CHAR(IC.IDX_DT, 'yyyyMMdd'), IC.VALT_ID
      INTO vIdxDt, vValtId
      FROM IDX_CLC IC
     WHERE IC.IDX_CLCID = vIdxClcId;

    --查询预测数据始于(年)
    select count(1)
      into v_count
      from IDX_MNT
     where IDX_ECD = 'O_P97'
       and VALT_ID = vValtId;
    IF v_count > 0 THEN
      select to_number(IDX_VAL)
        into vPreStartYear
        from IDX_MNT
       where IDX_ECD = 'O_P97'
         and VALT_ID = vValtId;
    ELSE
      os_msg := '[f_sum_pre_profit] - Error: [''未查询到预测开始年度，无法计算'']';
      RAISE_APPLICATION_ERROR(-20100, os_msg);
    END IF;
    --求和
    select sum(to_number(nvl(idx_val, '0')))
      into vResultVal
      from SBJ_AND_IDX_CLC_RSLT
     where IDX_ECD = vIdxEcd1
       and VALT_ID = vValtId
       and IDX_DT >= to_date(vPreStartYear || '1231', 'yyyyMMdd')
       and IDX_DT <= to_date(vIdxDt, 'yyyyMMdd');

    RETURN vResultVal;
  EXCEPTION
    WHEN OTHERS THEN
      os_msg := 'f_sum_pre_profit异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --DBMS_OUTPUT.PUT_LINE(os_msg);
      --函数异常返回null不抛出异常，继续执行
      RETURN NULL;
  END f_sum_pre_profit;

  FUNCTION ERROR_TO_NULL(vClcExpCntnt in varchar2) RETURN VARCHAR2 IS
    /*
     功能: 入参公式出现除数为0异常时，返回NULL，其余均返回入参不做任何处理
     创建人: 桂鹏飞
    */
    vSQL  VARCHAR2(2000);
    vTemp NUMBER;
  BEGIN
    vSQL := 'SELECT ' || vClcExpCntnt || ' FROM DUAL';
    EXECUTE IMMEDIATE vSQL
      INTO vTemp;

    RETURN vClcExpCntnt;
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -1476 THEN
        --捕获除数为0异常，返回null
        RETURN NULL;
      ELSE
        --其他异常均返回入参，不做任何处理处理
        RETURN vClcExpCntnt;
      END IF;
  END ERROR_TO_NULL;

  FUNCTION f_avg_fcs(vValtId in varchar2, -- 估值ID
                     vIdxEcd in varchar2 --指标编码
                     ) RETURN NUMBER IS
    /*
     功    能: 计算指标编码预测期平均值
     创 建 人: 林逸超
    */
    v_count       PLS_INTEGER := 0;
    os_msg        varchar2(1000);
    vResultVal    number;
    vPreStartYear number;
    vPreNum       number;
  BEGIN
    --查询预测数据始于(年)
    select count(1)
      into v_count
      from IDX_MNT
     where IDX_ECD = 'O_P97'
       and VALT_ID = vValtId;
    IF v_count > 0 THEN
      select to_number(IDX_VAL)
        into vPreStartYear
        from IDX_MNT
       where IDX_ECD = 'O_P97'
         and VALT_ID = vValtId;
    ELSE
      --默认为历史数据截止年 + 1
      select to_number(to_char(max(B.FNRPT_CODT), 'yyyy')) + 1
        into vPreStartYear
        from T_FA_CST_FNC_INF_IMPR A, CST_FNC_INF B
       where A.CST_FNC_STDSC = B.CST_FNC_INF_ID
         and A.FNC_ANL_ASES_RPT_ID = vValtId;
    END IF;
    --查询预测年数
    select count(1)
      into v_count
      from IDX_MNT
     where IDX_ECD = 'O_P96'
       and VALT_ID = vValtId;
    IF v_count > 0 THEN
      select to_number(nvl(IDX_VAL, IDX_REF_VAL))
        into vPreNum
        from IDX_MNT
       where IDX_ECD = 'O_P96'
         and VALT_ID = vValtId;
    END IF;
    --计算预测期均值
    select avg(idx_val)
      into vResultVal
      from SBJ_AND_IDX_CLC_RSLT a
     where a.idx_ecd = vIdxEcd
       and VALT_ID = vValtId
       and a.idx_dt >=
           to_date(to_char(vPreStartYear) || '1231', 'yyyymmdd')
       and a.idx_dt <=
           to_date(to_char(vPreStartYear + vPreNum) || '1231', 'yyyymmdd');
    RETURN vResultVal;
  EXCEPTION
    WHEN OTHERS THEN
      os_msg := 'f_avg_fcs异常信息: [' || SUBSTR(SQLERRM, 1, 300) || ']，报错行数：[' ||
                DBMS_UTILITY.format_error_backtrace || ']';
      --DBMS_OUTPUT.PUT_LINE(os_msg);
      --函数异常返回null不抛出异常，继续执行
      RETURN NULL;
  END f_avg_fcs;

  FUNCTION f_frct_ratnl_tst(vValtId in varchar2, -- 估值ID
                            vIdxEcd in varchar2 --指标编码
                            ) RETURN VARCHAR2 IS
    /*
     功    能: 合理性检验函数
     创 建 人: 林逸超
    */
    v_count    PLS_INTEGER := 0;
    os_msg     varchar2(1000);
    vItemValue varchar2(30);
    vSQL       varchar2(1000);
  BEGIN
    --查询指标计算公式
    for item in (select IDX_ECD, IDX_VAL
                   from SBJ_AND_IDX_CLC_RSLT
                  where VALT_ID = vValtId
                    and IDX_ECD = vIdxEcd
                    and IDX_ECD not like '%_009') loop
      --判断合理性效验表达式是否成立
      vSQL := 'SELECT count(1) FROM DUAL where ' || item.idx_val;
      EXECUTE IMMEDIATE vSQL
        INTO v_count;
      if v_count = 1 then
        vSQL := 'SELECT ''' || item.idx_ecd || ''' FROM DUAL where ' ||
                item.idx_val;
        EXECUTE IMMEDIATE vSQL
          INTO vItemValue;
      end if;
    end loop;
    RETURN vItemValue;
  EXCEPTION
    WHEN OTHERS THEN
      os_msg := 'f_avg_fcs异常信息: [' || SUBSTR(SQLERRM, 1, 300) || ']，报错行数：[' ||
                DBMS_UTILITY.format_error_backtrace || ']';
      --DBMS_OUTPUT.PUT_LINE(os_msg);
      --函数异常返回null不抛出异常，继续执行
      RETURN NULL;
  END f_frct_ratnl_tst;

  procedure proc_rcmm_ast_ref(vValtId in varchar2, -- 估值ID
                              vValtDt in varchar2, --估值日期（yyyyMMdd格式）
                              vIdyTp  in varchar2, --行业类别
                              vCstId  in varchar2, -- 客户编号
                              vOprId  in varchar2, -- 操作员编号
                              oi_flag out pls_integer, -- 1  成功  0 错误
                              os_msg  out varchar2 -- 出错信息
                              ) as
    vParaDt varchar2(8);
  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';

    vParaDt := vValtDt;
    if substr(vValtDt, 5, 4) = '1231' then
      vParaDt := substr(vValtDt, 0, 4) || '1230';
    end if;

    -- 推荐参考值
    sp_rcmm_ast_parm(vValtId,
                     vParaDt,
                     'D',
                     'PRJRQMANDCRLQLYIDXDSC',
                     vCstId,
                     vOprId,
                     oi_flag,
                     os_msg);

    -- 推荐上限值
    sp_rcmm_ast_parm(vValtId,
                     vParaDt,
                     'U',
                     'PLG_PRD_ULLT',
                     vCstId,
                     vOprId,
                     oi_flag,
                     os_msg);

    -- 推荐下限值
    sp_rcmm_ast_parm(vValtId,
                     vParaDt,
                     'L',
                     'RAD_CHK_IDX_DSC',
                     vCstId,
                     vOprId,
                     oi_flag,
                     os_msg);
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'proc_rcmm_ast_ref异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'proc_rcmm_ast_ref', os_msg, 'ER');
      -- 无超时处理
      -- proc_valt_rcrd(vValtId, '2', '1');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END proc_rcmm_ast_ref;

  procedure sp_rcmm_ast_parm(vValtId      in varchar2,
                             vParaDt      in varchar2,
                             vDfaltTp     in varchar2,
                             vIdxRefValTp in varchar2,
                             vCstId       in varchar2, -- 客户编号
                             vOprId       in varchar2, -- 操作员编号
                             oi_flag      out pls_integer,
                             os_msg       out varchar2) is
    v_sql varchar2(4000) := '';
    --v_dfalt_tp ast_parm_rcmm_cfg.dfalt_tp%TYPE;
    --v_idx_ref_val_tp varchar2(1000);

  begin
    oi_flag := 1;
    os_msg  := '处理成功';

    -- 推荐值
    v_sql := 'merge into ast_idx_mnt m
                using (select c.IDX_SRC_ECD idx_ecd,
                              case
                                when c.US_BT_MOD_TP_ECD = ''1'' then
                                 r.idx_val
                                when c.US_BT_MOD_TP_ECD = ''2'' then
                                 c.CLC_EXP_CNTNT
                                else
                                 null
                              end as idx_val
                         from ast_parm_rcmm_cfg c
                         left join sbj_and_idx_clc_rslt r
                           on r.valt_id = ''' || vValtId || '''
                          and r.idx_ecd = c.CLC_EXP_CNTNT
                          and r.idx_dt = to_date(''' || vParaDt ||
             ''', ''yyyyMMdd'')
                        where c.OPT_DFALT_VA = ''' || vDfaltTp ||
             ''') s
                on (m.BEMRAQPRTY_VALT_TRCNO = ''' || vValtId ||
             ''' and m.IDX_SRC_ECD = s.idx_ecd)
                when matched then
                  update set m.' || vIdxRefValTp ||
             ' = s.idx_val, m.UPTIME = sysdate
                when not matched then
                  insert (m.CUR_USR_INST_ID, m.IDX_SRC_ECD, m.BEMRAQPRTY_VALT_TRCNO, m.' ||
             vIdxRefValTp ||
             ',m.IDPY_CST_ID, m.CRT_PSN, m.LAST_MOD_STFF_RL_ID, m.FILE_CRT_TM, m.UPTIME) ' ||
             'values (SEQ_AST_IDX_MNT.Nextval, s.idx_ecd, ''' || vValtId ||
             ''', s.idx_val, ''' || vCstId || ''', ''' || vOprId ||
             ''', ''' || vOprId || ''', sysdate, sysdate)';

    --dbms_output.put_line(v_sql);

    execute immediate v_sql;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'sp_rcmm_ast_parm异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']' ||
                 v_sql;
      --异常信息打印并插入日志表
      proc_clc_log(vValtId, 'sp_rcmm_ast_parm', os_msg, 'ERROR');
      RAISE_APPLICATION_ERROR(-20100, os_msg);

  end sp_rcmm_ast_parm;

  FUNCTION f_ratio(vIdxEcd in varchar2 --指标编码
                   ) RETURN Number IS
    /*
     功    能: 指标值计算规则
    */
    v_count     PLS_INTEGER := 0;
    os_msg      varchar2(1000);
    vItemValue  number(30);
    vSQL        varchar2(1000);
    vIdxEcd_New varchar2(100);
    x           number;
    y           number;
    z           number;
  BEGIN
    --查询指标计算公式
    --dbms_output.put_line('vIdxEcd->' || vIdxEcd);
    --格式标准化：去除null及空格
    select replace(replace(upper(vIdxEcd), 'NULL', ''), ' ', '')
      into vIdxEcd_New
      from dual;
    --dbms_output.put_line('vIdxEcd_New->' || vIdxEcd_New);
    --对标准后的值集合转换为查询表
    select rtrim(regexp_substr(vIdxEcd_New || ',', '.*?' || ',', 1, 1), ',') AS xx,

           rtrim(regexp_substr(vIdxEcd_New || ',', '.*?' || ',', 1, 2), ',') AS yy,

           rtrim(regexp_substr(vIdxEcd_New || ',', '.*?' || ',', 1, 3), ',') AS zz
      into x, y, z
      from dual;
    dbms_output.put_line('x->' || x || ',y->' || y || ',z->' || z);
    if x is null or x = '' then
      if y is null or y = '' then
        if z is null or z = '' then
          vSQL := 'select 0 from dual';
        else
          vSQL := 'select ' || z || ' from dual';
        end if;
      else
        if z is null or z = '' then
          vSQL := 'select ' || y || ' from dual';
        else
          vSQL := 'select (' || y || '*0.3+' || z || '*0.2)*2 from dual';
        end if;
      end if;
    else
      if y is null or y = '' then
        if z is null or z = '' then
          vSQL := 'select ' || x || ' from dual';
        else
          vSQL := 'select (' || x || '*0.5+' || z || '*0.2)*10/7 from dual';
        end if;
      else
        if z is null or z = '' then
          vSQL := 'select (' || x || '*0.5+' || y || '*0.3)*10/8 from dual';
        else
          vSQL := 'select ' || x || '*0.5+' || y || '*0.3+' || z ||
                  '*0.2 from dual';
        end if;
      end if;
    end if;
    dbms_output.put_line('vSQL->' || vSQL);
    Execute immediate vSQL
      into vItemValue;
    RETURN vItemValue;
  EXCEPTION
    WHEN OTHERS THEN
      os_msg := 'f_ratio异常信息: [' || SUBSTR(SQLERRM, 1, 300) || ']，报错行数：[' ||
                DBMS_UTILITY.format_error_backtrace || ']';
      DBMS_OUTPUT.PUT_LINE(os_msg);
      --函数异常返回null不抛出异常，继续执行
      RETURN NULL;
  END f_ratio;

  procedure SP_RCMM_VALTMODLS(vValtId in varchar2, -- 估值ID
                              vParaDt in varchar2, -- 估值日期（yyyyMMdd格式）
                              vLstDt  in Date, -- 历史最近一期
                              vIdyTp  in varchar2, -- 行业类别【门类】
                              oi_flag out pls_integer, -- 1  成功  0 错误
                              os_msg  out varchar2 -- 出错信息
                              ) as
    /*
     功    能: 推荐备选及选中的估值模型
    */
    -- 备选估值模型集合
    vRecoValtIds varchar2(400);
    -- 选中的估值模型
    vRecoValtId varchar2(400);
  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';

    with t_mod_val as
     (select o.*, r.idx_val
        from t_fa_idy_mod_order o, sbj_and_idx_clc_rslt r
       where o.idx_ecd = r.idx_ecd
         and r.valt_id = vValtId
         and r.idx_dt = vLstDt
         and o.idy_ecd = vIdyTp
       order by o.sn asc),
    t_mod_order as
     (select PD_MODL_TP_ID
        from t_mod_val t1
       where t1.idx_val > 0
      union all
      select PD_MODL_TP_ID
        from t_mod_val t1
       where (t1.idx_val is null or t1.idx_val <= 0))
    select listagg(PD_MODL_TP_ID, ',') within group(order by rownum) mods
      into vRecoValtIds
      from t_mod_order;

    -- 备选估值模型
    --更新结果表 指标编码：O_P169
    UPDATE SBJ_AND_IDX_CLC_RSLT
       SET IDX_VAL = vRecoValtIds, MOD_TM = SYSDATE
     WHERE IDX_ECD = 'O_P169'
       AND VALT_ID = vValtId
       AND IDX_DT = to_date(vParaDt, 'yyyyMMdd');
    --更新维护表 指标编码：O_P169
    UPDATE IDX_MNT
       SET IDX_VAL = vRecoValtIds, MOD_TM = SYSDATE
     WHERE IDX_ECD = 'O_P169'
       AND VALT_ID = vValtId;

    -- 选中的估值模型
    vRecoValtId := substr(vRecoValtIds, 1, instr(vRecoValtIds, ',', 1) - 1);
    --更新结果表 指标编码：O_P168 O_P193
    UPDATE SBJ_AND_IDX_CLC_RSLT
       SET IDX_VAL = vRecoValtId, MOD_TM = SYSDATE
     WHERE IDX_ECD IN ('O_P168', 'O_P193')
       AND VALT_ID = vValtId
       AND IDX_DT = to_date(vParaDt, 'yyyyMMdd');

    --更新维护表 指标编码：O_P168 O_P193
    UPDATE IDX_MNT
       SET IDX_VAL = vRecoValtId, MOD_TM = SYSDATE
     WHERE IDX_ECD IN ('O_P168', 'O_P193')
       AND VALT_ID = vValtId;

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'SP_RECO_VALTMODLS异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      -- 异常信息打印并插入日志表
      PKG_VALT.proc_clc_log(vValtId, 'SP_RECO_VALTMODLS', os_msg, 'ERROR');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END SP_RCMM_VALTMODLS;

  procedure SP_REF_VALTMODL(vValtId in varchar2, -- 估值ID
                            vValtDt in varchar2, -- 估值日期（yyyyMMdd格式）
                            vIdyTp  in varchar2, -- 行业类别
                            vCstId  in varchar2, -- 客户编号
                            vOprId  in varchar2, -- 操作员编号
                            oi_flag out pls_integer, -- 1  成功  0 错误
                            os_msg  out varchar2 -- 出错信息
                            ) as
    /*
     功    能: 后台默认 推荐估值
    */
    vRefValtId varchar2(400);
    vParaDt    varchar2(8);
  BEGIN
    oi_flag := 1;
    os_msg  := '处理成功';
    -- 超时处理
    --proc_valt_rcrd(vValtId, '1', '0');
    vRefValtId := 'REF_' || vValtId;
    -- 1.
    delete from T_FA_REF_VALT_RCRD where HW_ID = vValtId;

    -- 2.
    insert into T_FA_REF_VALT_RCRD(BEMRAQPRTY_VALT_TRCNO, HW_ID, ISR_ID)
      select valt_jrnl_no,
             valt_id,
             vRefValtId ISR_ID
        from VALT_RCRD
       where VALT_ID = vValtId;

    -- 3.
    PKG_VALT.proc_inlz_valtmodl_parm(vRefValtId,
                                     vValtDt,
                                     vIdyTp,
                                     vCstId,
                                     vOprId,
                                     oi_flag,
                                     os_msg);

    -- 4.
    update idx_mnt
       set idx_val = idx_ref_val,
           MOD_TM = sysdate
     where valt_id = vRefValtId
       and idx_val is null
       and idx_ref_val is not null;

    update ast_idx_mnt
       set CRTCL_IDX_VAL1 = PRJRQMANDCRLQLYIDXDSC,
           PLT_DTL = '1',
           UPTIME = sysdate
     where BEMRAQPRTY_VALT_TRCNO = vRefValtId
       and CRTCL_IDX_VAL1 is null
       and PRJRQMANDCRLQLYIDXDSC is not null;

    -- 5.
    PKG_VALT.proc_clc_valtmodl_idx(vRefValtId,
                                   vValtDt,
                                   vIdyTp,
                                   vCstId,
                                   vOprId,
                                   oi_flag,
                                   os_msg);

    -- 6. 更新推荐选中的估值模型编码
    vParaDt := vValtDt;
    if substr(vValtDt, 5, 4) = '1231' then
      vParaDt := substr(vValtDt, 0, 4) || '1230';
    end if;

    /**
    update T_FA_REF_VALT_RCRD rc
     set rc.PM_VALT_ECD =
         (select r.idx_val
            from sbj_and_idx_clc_rslt r
           where r.valt_id = vRefValtId
             and r.idx_dt = vParaDt
             and r.idx_ecd = 'O_P193')
    where rc.isr_id = vRefValtId;**/

    update T_FA_REF_VALT_RCRD set pm_valt_ecd=(select idx_val from idx_mnt where valt_id = vValtId and idx_ecd='O_P168') where HW_ID= vValtId and pm_valt_ecd is null;
    commit;

    -- 超时处理
    --proc_valt_rcrd(vValtId, '1', '1');

    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      oi_flag := 0;
      os_msg  := 'SP_REF_VALTMODL异常信息: [' || SUBSTR(SQLERRM, 1, 300) ||
                 ']，报错行数：[' || DBMS_UTILITY.format_error_backtrace || ']';
      -- 异常信息打印并插入日志表
      PKG_VALT.proc_clc_log(vValtId, 'SP_REF_VALTMODL', os_msg, 'ERROR');
      -- 超时处理
      --PKG_VALT.proc_valt_rcrd(vValtId, '1', '1');
      RAISE_APPLICATION_ERROR(-20100, os_msg);
  END SP_REF_VALTMODL;

END PKG_VALT;
/
