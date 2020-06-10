package sample.pr.main;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import sample.ap.DbAction;

public final class MainAction extends Action {

	// DB接続用オブジェクト
	private DbAction dba = new DbAction();

	// 遷移先
	private String forward;

	DbAction dbaction = new DbAction();

	/**
	 * <p>
	 * メイン画面アクションの初期設定を行う。
	 * </p>
	 * 
	 * 1.初期設定を行う。<br>
	 * 　1-1.DB接続クラスのインスタンスを生成する。<br>
	 * 　1-2.遷移先<br>
	 * 　　遷移先：""<br>
	 * 2.例外発生時の処理。<br>
	 * 　2-1.IOExceptionをthrowする。<br>
	 * <br>
	 * 
	 * @throws IOException
	 *             -
	 */
	public MainAction() throws IOException {

	}

	/**
	 * <p>
	 * クリックされたボタンを判定し、遷移先情報を返却する。
	 * </p>
	 * 
	 * 1.メイン画面のアクションフォーム情報をインプットパラメータ.アクションフォームから取得する。<br>
	 * <br>
	 * 2.クリックされたボタンの名称をアクションフォームから取得する。<br>
	 * 　2-1.ボタン名称取得処理をコール。<br>
	 * 　　クラス　：MainForm<br>
	 * 　　メソッド：getButton()<br>
	 * 　2-2.社員番号を整形する。<br>
	 * 　　形式：4桁の文字列<br>
	 * 　　※桁数が4桁未満の場合は先頭から"0"埋め)<br>
	 * <br>
	 * 3.社員名を取得する。<br>
	 * 　3-1.社員名取得処理をコール。<br>
	 * 　　クラス　：DbAction<br>
	 * 　　メソッド：getSyainName()<br>
	 * 　　　引数１：メイン画面アクションフォーム<br>
	 * <br>
	 * 4.社員名が取得できた場合の処理。<br>
	 * 　4-1.押下されたボタンを判定してそれぞれの処理をコール。<br>
	 * 　　4-1-1.出社ボタン押下処理をコール。<br>
	 * 　　　クラス　：MainAction<br>
	 * 　　　メソッド：clickBtnIn()<br>
	 * 　　　　引数１：メイン画面アクションフォーム<br>
	 * 　　4-1-2.退社ボタン押下処理をコール。<br>
	 * 　　　クラス　：MainAction<br>
	 * 　　　メソッド：clickBtnOut()<br>
	 * 　　　　引数１：メイン画面アクションフォーム<br>
	 * 　　4-1-3.参照ボタン押下処理をコール。<br>
	 * 　　　クラス　：MainAction<br>
	 * 　　　メソッド：clickBtnView()<br>
	 * 　　　　引数１：メイン画面アクションフォーム<br>
	 * 　4-2.遷移先を設定する。<br>
	 * 　　遷移先：各ボタン押下処理の戻り値<br>
	 * <br>
	 * 5.社員名が取得できなかった場合の処理。<br>
	 * 　5-1.メッセージを設定する。<br>
	 * 　　メッセージ：「社員マスタに存在しない社員番号です。」<br>
	 * 　5-2.遷移先を設定する。<br>
	 * 　　遷移先："message"<br>
	 * <br>
	 * 6.アクションフォームをインプットパラメータ.リクエスト情報に設定する。<br>
	 * 　6-1.リクエスト情報登録処理をコール。<br>
	 * 　　クラス　：HttpServletRequest<br>
	 * 　　メソッド：setAttribute()<br>
	 * 　　　引数１："form"<br>
	 * 　　　引数２：メイン画面アクションフォーム<br>
	 * <br>
	 * 7.戻り値を返却する。<br>
	 * 　7-1.遷移先情報取得処理をコール。<br>
	 * 　　クラス　：ActionMapping<br>
	 * 　　メソッド：findForward(遷移先)<br>
	 * <br>
	 * 
	 * @param map
	 *            アクションマッピング<br>
	 *            frm アクションフォーム<br>
	 *            request リクエスト情報<br>
	 *            response レスポンス情報<br>
	 * @return 遷移先情報
	 * 
	 */
	public ActionForward execute (ActionMapping map,ActionForm frm,HttpServletRequest request,HttpServletResponse response) {

		
		
		// アクションフォームBeanより入力フォームのデータを取り出す処理
		// フォーム情報をキャスト
		MainForm mForm = (MainForm) frm;
		
		// フォームへ入力された情報をとりだす。
		String syain_no = mForm.getSyain_no();
		// クリックされたボタンの名称をアクションフォームから取得
		String button = mForm.getButton();
		
		// 社員番号を整形
		// 　　※桁数が4桁未満の場合は先頭から"0"埋め)<br>
		if(syain_no.length() < 4) {
			for(int length = syain_no.length(); length < 4; length++ ) {
				syain_no = "0" + syain_no;
			}
		}
		
		// 社員名の取得
		// 　　クラス　：DbAction<br>
		// 　　メソッド：getSyainName()<br>
			// 社員名を取得できた場合
		DbAction dAction;
		try {
			dAction = new DbAction();

			if(dAction.getSyainName(mForm)) {
				switch(button) {
				case "syussya":
					clickBtnIn(mForm);
					break;
				case "taisya":
					
					break;
				case "sansyou":
					
					break;
				}
			}

		/* 5.社員名が取得できなかった場合の処理。<br>
		 * 　5-1.メッセージを設定する。<br>
		 * 　　メッセージ：「社員マスタに存在しない社員番号です。」<br>
		 * 　5-2.遷移先を設定する。<br>
		 * 　　遷移先："message"<br>
		 */
			else {
				mForm.setMessage("社員マスタに存在しない社員番号です。");
				return (map.findForward("message"));
			}
			
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		/* 6.アクションフォームをインプットパラメータ.リクエスト情報に設定する。<br>
		 * 　6-1.リクエスト情報登録処理をコール。<br>
		 * 　　クラス　：HttpServletRequest<br>
		 * 　　メソッド：setAttribute()<br>
		 * 　　　引数１："form"<br>
		 * 　　　引数２：メイン画面アクションフォーム
		 */
		request.setAttribute("form", mForm);
		
		/* 7.戻り値を返却する。<br>
		 * 　7-1.遷移先情報取得処理をコール。<br>
		 * 　　クラス　：ActionMapping<br>
		 * 　　メソッド：findForward(遷移先)<br>
		 */
		return map.findForward(forward);
	}

	/**
	 * <p>
	 * 出社メソッド
	 * </p>
	 * 
	 * 1.出退時間を取得する。<br>
	 * 　1-1.出退時間取得処理を呼び出し<br>
	 * 　　クラス　：DbAction<br>
	 * 　　メソッド：getTimeFromTo()<br>
	 * 　　引数１　：メイン画面アクションフォーム<br>
	 * 2.出社時間未登録の場合の処理。<br>
	 * 　2-1.出社時間登録処理を呼び出し<br>
	 * 　　クラス　：DbAction<br>
	 * 　　メソッド：setTimeFrom()<br>
	 * 　2-2.メッセージ出力<br>
	 * 　　"出社しました。"<br>
	 * 3.出社時間登録済みの場合<br>
	 * 　3-1.メッセージ出力<br>
	 * 　　"既に出社しています。"<br>
	 * 
	 * @param form
	 *            メイン画面アクションフォーム
	 * @return 遷移先
	 */
	private String clickBtnIn(MainForm form) {

		form.setTime_from(time_get());
		// 出社時間が入力されていなかったら...
		if (dba.getTimeFromTo(form)) {
			
			/*
			String day = String.format("%tY年 %tm月 %td日", time_get().substring(0,8));
				//	time_get().substring(0,8);
			String time = time_get().substring(9);*/
			
			Date today = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
			
			dba.setTimeFrom(form);
			form.setMessage(form.getSyain_name() + "　出社しました。");
			form.setDtime(format.format(today));
		}
		// 出社時間が入力されていたら...
		else {
			System.out.println("既に出社しています。");
			form.setMessage("既に出社しています。");
		}
		forward = "message";

		return forward;
	}

	/**
	 * <p>
	 * 退社メソッド
	 * </p>
	 * 
	 * 1.出退時間を取得する。<br>
	 * 　1-1.出退時間取得処理を呼び出し<br>
	 * 　　クラス　：DbAction<br>
	 * 　　メソッド：getTimeFromTo()<br>
	 * 　　引数１　：メイン画面アクションフォーム<br>
	 * 2.退社時間登録済みの場合<br>
	 * 　2-1.メッセージ出力<br>
	 * 　　"既に退社しています。"<br>
	 * 3.退社時間未登録の場合の処理。<br>
	 * 　3-1.出社時間登録処理を呼び出し<br>
	 * 　　クラス　：DbAction<br>
	 * 　　メソッド：setTimeTo()<br>
	 * 　3-2.メッセージ出力<br>
	 * 　　"退社しました。"<br>
	 * 
	 * @param form
	 *            メイン画面アクションフォーム
	 * @return 遷移先
	 */
	private String clickBtnOut(MainForm form) {

		// 出退時間取得
		boolean result = dba.getTimeFromTo(form);

		if (dba.setTimeTo(form)) {
			System.out.println("退社しました。");
		}
		// 出社時間が入力されていたら...
		else {
			System.out.println("既に退社しています。");
		}

		return forward;
	}

	/**
	 * 参照メソッド
	 * 
	 * 1.勤怠情報取得メソッド<br>
	 * 　クラス　：DbAction<br>
	 * 　メソッド：getKintaiInfo()<br>
	 * 2.勤怠情報登録済の場合。<br>
	 * 　2-1.戻り値を設定する。<br>
	 * 　　返却値："view"<br>
	 * 3.勤怠情報未登録の場合。<br>
	 * 　3-1.メッセージを設定する。<br>
	 * 　　メッセージ：「勤怠情報がありません。」<br>
	 * 　3-2.戻り値を設定する。<br>
	 * 　　返却値："message"<br>
	 *
	 * @param form
	 *            メイン画面アクションフォーム
	 * @return 遷移先
	 */
	private String clickBtnView(MainForm form) {
		
		// 勤怠情報取得
		boolean result = dba.getKintaiInfo(form);
		
		
		if(result) {
			return "view";
		}
		else {
			System.out.println("勤怠情報がありません。");
			return "message";
		}
		
	}
	public static String time_get() {
		LocalDateTime date1 = LocalDateTime.now();
		// 日付の取得
		DateTimeFormatter dtformat1 = 
				DateTimeFormatter.ofPattern("yyyy年MM月dd日");
		String day = dtformat1.format(date1);
		// 時間の取得
		DateTimeFormatter dtformat2 = 
				DateTimeFormatter.ofPattern("HHmm");
		String time = dtformat2.format(date1);
		
		// 日付と時間の取得
		DateTimeFormatter dtformat3 = 
				DateTimeFormatter.ofPattern("yyyyMMdd,HHmm");
		String datetime = dtformat3.format(date1);
		System.out.println(day);
		System.out.println(time);
		System.out.println(datetime);
		
		return datetime;
	}
}