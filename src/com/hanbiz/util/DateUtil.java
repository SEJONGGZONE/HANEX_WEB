package com.hanbiz.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
/**
 * 
 * @author dkpark
 *
 */
public class DateUtil {
	/**
	 * 기본 날짜 포맷
	 */
	public final static String DEFAULT_DATE_FORMAT = "yyyyMMddHHmmss";

	/**
	 * 일반 날짜 포맷 (KICC 날짜 포맷)
	 */
	public final static String GENERAL_DATE_FORMAT = "yyyyMMdd";

	/**
	 * 기본 TimeZone
	 */
	public final static String DEFAULT_TIMEZONE = "JST";

	/**
	 * Date를 timezone과 format에 따른 날짜 String으로 변환해서 리턴한다.
	 * 
	 * @param date
	 *            날짜(String)
	 * @return 날짜 String을 리턴한다. 변환도중 error발생시 null을 리턴한다.
	 */
	public static String getYearMD(String date) {
		try {
			if (date.equals("") || date.equals(" ") || date.equals("null") || date.equals(null)) {
				return " ";
			}
			java.util.TimeZone homeTz = java.util.TimeZone.getTimeZone("JST");
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy년 MM월 dd일");
			formatter.setTimeZone(homeTz);
			return formatter.format(getDate(date, "yyyyMMdd"));
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * Date를 timezone과 format에 따른 날짜 String으로 변환해서 리턴한다.
	 * 
	 * @param date
	 *            날짜
	 * @param format
	 *            날짜 포맷 (예) yyyyMMddHHmmss
	 * @param timezone
	 *            Timezone (예) JST
	 * @return 날짜 String을 리턴한다. 변환도중 error발생시 null을 리턴한다.
	 */
	public static String getFormattedDate(Date date, String format, String timezone) {
		try {
			java.util.TimeZone homeTz = java.util.TimeZone.getTimeZone(timezone);
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(format);
			formatter.setTimeZone(homeTz);
			return formatter.format(date);
		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * Date를 format에 따른 날짜 String으로 변환해서 리턴한다. (DEFAULT_TIMEZONE을 사용)
	 * 
	 * @param date
	 *            날짜
	 * @param format
	 *            날짜 포맷 (예) yyyyMMddHHmmss
	 * @return 날짜 String을 리턴한다. 변환도중 error발생시 null을 리턴한다.
	 */
	public static String getFormattedDate(Date date, String format) {
		return getFormattedDate(date, format, DEFAULT_TIMEZONE);
	}

	/**
	 * Date를 날짜 String으로 변환해서 리턴한다. (DEFAULT_TIMEZONE과 DEFAULT_DATE_format을 사용)
	 * 
	 * @param date
	 *            날짜
	 * @return 날짜 String을 리턴한다. 변환도중 error발생시 null을 리턴한다.
	 */
	public static String getFormattedDate(Date date) {
		return getFormattedDate(date, DEFAULT_DATE_FORMAT);
	}

	/**
	 * 날짜 String을 Date로 변환해서 리턴한다.
	 * 
	 * @param date
	 *            날짜 String
	 * @param format
	 *            날짜 포맷
	 * @return 날짜 String을 Date로 변환해서 리턴한다. 변환도중 error발생시 null을 리턴한다.
	 */
	public static Date getDate(String date, String format) {
		if ((date == null) || (format == null))
			return null;

		try {
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(format);
			return formatter.parse(date, new java.text.ParsePosition(0));
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 날짜 String을 Date로 변환해서 리턴한다. (DEFAULT_DATE_format을 사용)
	 * 
	 * @return 날짜 String을 Date로 변환해서 리턴한다. 변환도중 error발생시 null을 리턴한다.
	 */
	public static Date getDate(String date) {
		return getDate(date, DEFAULT_DATE_FORMAT);
	}

	/**
	 * src_date가 시간상 target_date 이전인지를 check한다.
	 * 
	 * @param format
	 *            날짜 포맷
	 * @return src_date가 target_date이전이면 true를 그렇지 않으면 false를 리턴한다.
	 * @exception IllegalArgumentException
	 *                날짜 String이 포맷과 맞지 않을 경우 발생한다.
	 */
	public static boolean before(String src_date, String target_date, String format) {
		Date src = getDate(src_date, format);
		Date target = getDate(target_date, format);

		if ((src == null) || (target == null)) {
			throw new java.lang.IllegalArgumentException();
		}

		return src.before(target);
	}

	/**
	 * src_date가 시간상 target_date 이전인지를 check한다. (DEFAULT_DATE_format을 사용)
	 * 
	 * @return src_date가 target_date이전이면 true를 그렇지 않으면 false를 리턴한다.
	 * @exception IllegalArgumentException
	 *                날짜 String이 포맷과 맞지 않을 경우 발생한다.
	 */
	public static boolean before(String src_date, String target_date) {
		return before(src_date, target_date, DEFAULT_DATE_FORMAT);
	}

	/**
	 * src_date가 시간상 target_date 이후인지를 check한다.
	 * 
	 * @param format
	 *            날짜 포맷
	 * @return src_date가 target_date이후이면 true를 그렇지 않으면 false를 리턴한다.
	 * @exception IllegalArgumentException
	 *                날짜 String이 포맷과 맞지 않을 경우 발생한다.
	 */
	public static boolean after(String src_date, String target_date, String format) {
		Date src = getDate(src_date, format);
		Date target = getDate(target_date, format);

		if ((src == null) || (target == null)) {
			throw new java.lang.IllegalArgumentException();
		}

		return src.after(target);
	}

	/**
	 * src_date가 시간상 target_date 이후인지를 check한다. (DEFAULT_DATE_format을 사용)
	 * 
	 * @return src_date가 target_date이후이면 true를 그렇지 않으면 false를 리턴한다.
	 * @exception IllegalArgumentException
	 *                날짜 String이 포맷과 맞지 않을 경우 발생한다.
	 */
	public static boolean after(String src_date, String target_date) {
		return after(src_date, target_date, DEFAULT_DATE_FORMAT);

	}

	/**
	 * src_date가 시간상 target_date와 같은지 check한다.
	 * 
	 * @param format
	 *            날짜 포맷
	 * @return src_date가 target_date와 같으면 true를 그렇지 않으면 false를 리턴한다.
	 * @exception IllegalArgumentException
	 *                날짜 String이 포맷과 맞지 않을 경우 발생한다.
	 */
	public static boolean equals(String src_date, String target_date, String format) {
		Date src = getDate(src_date, format);
		Date target = getDate(target_date, format);

		if ((src == null) || (target == null)) {
			throw new java.lang.IllegalArgumentException();
		}

		return (src.compareTo(target) == 0) ? true : false;
	}

	/**
	 * src_date가 시간상 target_date와 같은지 check한다.
	 * 
	 * @return src_date가 target_date와 같으면 true를 그렇지 않으면 false를 리턴한다.
	 * @exception IllegalArgumentException
	 *                날짜 String이 포맷과 맞지 않을 경우 발생한다.
	 */
	public static boolean equals(String src_date, String target_date) {
		return equals(src_date, target_date, DEFAULT_DATE_FORMAT);
	}

	/**
	 * start_date와 end_date 를 비교해서 새글여부를 리턴한다.
	 * 
	 * @param format
	 *            날짜 포맷
	 * @exception IllegalArgumentException
	 *                Parameter가 null이거나 날짜 포맷과 맞지 않는 경우 발생
	 */
	public static boolean getNewYn(String src_date, String target_date, int day, String format) {
		for (int i = src_date.length(); i < 14; i++) {
			src_date = src_date + "0";
		}
		for (int i = target_date.length(); i < 14; i++) {
			target_date = target_date + "0";
		}

		// day가 0이면 년월일만 같으면 새글임
		// if( day == 0 ) {
		if (true) {
			format = "yyyyMMdd";

			src_date = src_date.substring(0, 8);
			target_date = target_date.substring(0, 8);
			// System.out.println(src_date);
			// System.out.println(target_date);

			return src_date.equals(target_date);
			// return equals(src_date, target_date, format);
		}

		@SuppressWarnings("unused")
		Date date = getDate(src_date, format);
		if (date == null)
			throw new java.lang.IllegalArgumentException();

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(format));
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_YEAR, day);
		src_date = getFormattedDate(cal.getTime(), format);

		Date src = getDate(src_date, format);
		Date target = getDate(target_date, format);

		// System.out.println(src);
		// System.out.println(target);
		// src_date가 target_date 이후이면 true(신규)를 그렇지 않으면 false를 리턴한다.
		return src.after(target);
	}

	/**
	 * start_date와 end_date 사이의 날자 간격을 리턴한다.
	 * 
	 * @param format
	 *            날짜 포맷
	 * @exception IllegalArgumentException
	 *                Parameter가 null이거나 날짜 포맷과 맞지 않는 경우 발생
	 */
	public static int difference(String start_date, String end_date, String format) {
		Date start = getDate(start_date, format);
		Date end = getDate(end_date, format);

		if ((start == null) || (end == null)) {
			throw new java.lang.IllegalArgumentException();
		}

		long lStart = (long) (start.getTime() / (1000 * 60 * 60 * 24));
		long lEnd = (long) (end.getTime() / (1000 * 60 * 60 * 24));

		return (int) Math.abs(lStart - lEnd);
	}

	/**
	 * start_date와 end_date 사이의 날자 간격을 리턴한다. (DEFAULT_DATE_format 사용)
	 * 
	 * @exception IllegalArgumentException
	 *                Parameter가 null이거나 날짜 포맷과 맞지 않는 경우 발생
	 */
	public static int difference(String start_date, String end_date) {
		return difference(start_date, end_date, DEFAULT_DATE_FORMAT);
	}

	/**
	 * src_date가 시간상 start_date와 end_date 사이에 있는지 check한다.
	 * 
	 * @param format
	 *            날짜 포맷
	 * @return true if start_data <= src_date <= end_date, otherwise false
	 * @exception IllegalArgumentException
	 *                날짜 String이 포맷과 맞지 않을 경우 발생
	 */
	public static boolean between(String src_date, String start_date, String end_date, String format) {
		Date src = getDate(src_date, format);
		Date start = getDate(start_date, format);
		Date end = getDate(end_date, format);

		if ((src == null) || (start == null) || (end == null)) {
			throw new java.lang.IllegalArgumentException();
		}

		return ((src.compareTo(start) < 0) || (src.compareTo(end) > 0)) ? false : true;
	}

	/**
	 * src_date가 시간상 start_date와 end_date 사이에 있는지 check한다. (DEFAULT_DATE_format을
	 * 사용)
	 * 
	 * @return true if start_data <= src_date <= end_date, otherwise false
	 * @exception IllegalArgumentException
	 *                날짜 String이 포맷과 맞지 않을 경우 발생한다.
	 */
	public static boolean between(String src_date, String start_date, String end_date) {
		return between(src_date, start_date, end_date, DEFAULT_DATE_FORMAT);
	}

	/**
	 * src_date가 시간상 start_date와 end_date 사이에 있는지 check한다.
	 * 
	 * @return true if start_data <= src_date <= end_date, otherwise false
	 * @exception IllegalArgumentException
	 *                Parameter가 null이거나 날짜 포맷과 맞지 않는 경우 발생
	 */
	public static boolean between(Date src_date, Date start_date, Date end_date) {
		if ((src_date == null) || (start_date == null) || (end_date == null)) {
			throw new java.lang.IllegalArgumentException();
		}

		return ((src_date.compareTo(start_date) < 0) || (src_date.compareTo(end_date) > 0)) ? false : true;
	}

	/**
	 * date를 기준으로 n 분을 더한 날짜를 리턴한다.
	 * 
	 * @exception IllegalArgumentException
	 *                date가 null이면 발생
	 */
	public static Date addMinute(Date date, int minute) {
		if (date == null)
			throw new java.lang.IllegalArgumentException();

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(DEFAULT_TIMEZONE));
		cal.setTime(date);
		cal.add(Calendar.MINUTE, minute);
		return cal.getTime();
	}

	/**
	 * date를 기준으로 n 초 더한 날짜를 리턴한다.
	 * 
	 * @exception IllegalArgumentException
	 *                date가 null이면 발생
	 */
	public static Date addSecond(Date date, int second) {
		if (date == null)
			throw new java.lang.IllegalArgumentException();

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(DEFAULT_TIMEZONE));
		cal.setTime(date);
		cal.add(Calendar.SECOND, second);
		return cal.getTime();
	}

	/**
	 * date를 기준으로 n 시간을 더한 날짜를 리턴한다.
	 * 
	 * @exception IllegalArgumentException
	 *                date가 null이면 발생
	 */
	public static Date addHour(Date date, int hour) {
		if (date == null)
			throw new java.lang.IllegalArgumentException();

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(DEFAULT_TIMEZONE));
		cal.setTime(date);
		cal.add(Calendar.HOUR, hour);
		return cal.getTime();
	}

	/**
	 * date를 기준으로 n날을 더한 날짜를 리턴한다.
	 * 
	 * @exception IllegalArgumentException
	 *                date가 null이면 발생
	 */
	public static Date addDay(Date date, int day) {
		if (date == null)
			throw new java.lang.IllegalArgumentException();

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(DEFAULT_TIMEZONE));
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_YEAR, day);
		return cal.getTime();
	}

	/**
	 * date를 기준으로 n날을 더한 날짜를 리턴한다.
	 * 
	 * @exception IllegalArgumentException
	 *                date가 null이면 발생
	 */
	public static Date addDay(Date date, int day, String format) {
		if (date == null)
			throw new java.lang.IllegalArgumentException();

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(format));
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_YEAR, day);
		return cal.getTime();
	}

	/**
	 * date를 기준으로 n날을 더한 날짜를 리턴한다.
	 * 
	 * @exception IllegalArgumentException
	 *                date가 null이면 발생
	 */
	public static String addDay(String src_date, int day) {
		Date date = getDate(src_date, DEFAULT_TIMEZONE);
		if (date == null)
			throw new java.lang.IllegalArgumentException();

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(DEFAULT_TIMEZONE));
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_YEAR, day);
		return getFormattedDate(cal.getTime(), DEFAULT_DATE_FORMAT);
	}

	/**
	 * date를 기준으로 n날을 더한 날짜를 리턴한다.
	 * 
	 * @exception IllegalArgumentException
	 *                date가 null이면 발생
	 */
	public static String addDay(String src_date, int day, String format) {
		Date date = getDate(src_date, format);
		if (date == null)
			throw new java.lang.IllegalArgumentException();

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(format));
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_YEAR, day);
		return getFormattedDate(cal.getTime(), format);
	}

	public static int getNewIcon(String strToDay, String strUdate, int intDay) {
		if (Long.parseLong(strToDay) < Long.parseLong(addDay(strUdate, intDay, "yyyyMMddHHmiss")))
			return 1;
		else
			return 0;
	}

	/**
	 * date를 기준으로 n주를 더한 날짜를 리턴한다.
	 * 
	 * @exception IllegalArgumentException
	 *                date가 null일 경우 발생
	 */
	public static Date addWeek(Date date, int week) {
		if (date == null)
			throw new java.lang.IllegalArgumentException();

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(DEFAULT_TIMEZONE));
		cal.setTime(date);
		cal.add(Calendar.WEEK_OF_YEAR, week);
		return cal.getTime();
	}

	/**
	 * date를 기준으로 n달을 더한 날짜를 리턴한다.
	 * 
	 * @exception IllegalArgumentException
	 *                date가 null일 경우 발생
	 */
	public static Date addMonth(Date date, int month) {
		if (date == null)
			throw new java.lang.IllegalArgumentException();

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(DEFAULT_TIMEZONE));
		cal.setTime(date);
		cal.add(Calendar.MONTH, month);
		return cal.getTime();
	}

	/**
	 * Long을 입력받아 시간:분 형태로 되돌린다.
	 * 
	 * @return
	 */
	public static String getLongTimeToStr(long str) {
		String minutes = "" + str % 60;
		String hours = "" + str / 60;

		if (Integer.parseInt(hours) < 10) {
			hours = "0" + hours;
		}
		if (Integer.parseInt(minutes) < 10) {
			minutes = "0" + minutes;
		}
		return hours + ":" + minutes;
	}

	/**
	 * date를 기준으로 n년을 더한 날짜를 리턴한다.
	 * 
	 * @exception IllegalArgumentException
	 *                date가 null일 경우 발생
	 */
	public static Date addYear(Date date, int year) {
		if (date == null)
			throw new java.lang.IllegalArgumentException();

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(DEFAULT_TIMEZONE));
		cal.setTime(date);
		cal.add(Calendar.YEAR, year);
		return cal.getTime();
	}

	/**
	 * test 용 method.
	 */
	public static void main(String[] args) {
		System.out.println("diff (20000502121200, 20000503001200) = " + difference("20000502121200", "20000503121200"));
		// getFormattedDate(Date date, String format, String timezone) 테스트

		// getFormattedDate(Date date, String format) 테스트

		// getFormattedDate(Date date) 테스트
		String strCurrentDate = getFormattedDate(new Date());
		System.out.println("Current date = " + strCurrentDate);

		// getDate(String date, String format) 테스트

		// getDate(String date) 테스트
		Date dateCurrentDate = getDate(strCurrentDate);
		System.out.println("Current date = " + dateCurrentDate);

		// before(String src_date, String target_date, String format) 테스트

		// before(String src_date, String target_date) 테스트

		// after(String src_date, String target_date, String format) 테스트

		// after(String src_date, String target_date) 테스트

		// equals(String src_date, String target_date, String format) 테스트

		// equals(String src_date, String target_date) 테스트

		// between(String src_date, String start_date, String end_date, String
		// format) 테스트

		// between(String src_date, String start_date, String end_date) 테스트

		// between(Date src_date, Date start_date, Date end_date) 테스트

		// addDay(Date date, int day) 테스트
		System.out.println("addDay(Date date, int day) 테스트");
		System.out.println("date = " + new Date());
		System.out.println("date + 5 day = " + addDay(new Date(), 5));
		// addMonth(Date date, int month) 테스트

		// addYear(Date date, int year) 테스트
	}

	public static String getCurrentDate(String format) {
		String strCurrentDate = "";

		if (format.length() <= 0)
			format = DEFAULT_DATE_FORMAT;

		java.util.TimeZone homeTz = java.util.TimeZone.getTimeZone(DEFAULT_TIMEZONE);
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(format);
		formatter.setTimeZone(homeTz);
		strCurrentDate = formatter.format(new Date());

		return strCurrentDate;
	}

	/***
	 * long을 입력받아 날짜 형태로 리턴
	 * 
	 * @param datetime
	 * @param format
	 * @return
	 */
	public static String getLongToDate(long datetime, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(datetime);
		String date = sdf.format(cal.getTime());

		return date;
	}
}
