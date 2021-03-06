package com.dy.oa.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileOperateUtil {
	public static String FILEDIR = null;

	/**
	 * 上传
	 * 
	 * @param request
	 * @throws IOException
	 */
	public static String upload(HttpServletRequest request) throws IOException {
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = mRequest.getFileMap();
		File file = new File(FILEDIR);

		if (!file.exists()) {
			file.mkdir();
		}
		System.out.println(file.getPath());
		Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, MultipartFile> entry = it.next();
			MultipartFile mFile = entry.getValue();
			System.out.println("mFile:" + mFile);
			if (mFile.getSize() != 0 && !"".equals(mFile.getName())) {
				String filePath = initFilePath(mFile.getOriginalFilename());
				System.out.println("filePath:" + filePath);
				write(mFile.getInputStream(), new FileOutputStream(filePath));
				return filePath;
			}
		}
		return "";
	}

	private static String initFilePath(String name) {
		String dir = getFileDir(name) + "";
		File file = new File(FILEDIR + dir);
		if (!file.exists()) {
			file.mkdir();
		}
		Long num = new Date().getTime();
		Double d = Math.random() * num;
		return (file.getPath() + "/" + num + d.longValue() + "_" + name).replaceAll(" ", "-");
	}

	private static int getFileDir(String name) {
		return name.hashCode() & 0xf;
	}

	public static void download(String downloadfFileName, ServletOutputStream out) {
		try {
			FileInputStream in = new FileInputStream(new File(FILEDIR + "/" + downloadfFileName));
			write(in, out);
		} catch (FileNotFoundException e) {
			try {
				FileInputStream in = new FileInputStream(
						new File(FILEDIR + "/" + new String(downloadfFileName.getBytes("iso-8859-1"), "utf-8")));
				write(in, out);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 写入数据
	 * 
	 * @param in
	 * @param out
	 * @throws IOException
	 */
	public static void write(InputStream in, OutputStream out) throws IOException {
		try {
			byte[] buffer = new byte[1024];
			int bytesRead = -1;
			while ((bytesRead = in.read(buffer)) != -1) {
				out.write(buffer, 0, bytesRead);
			}
			out.flush();
		} finally {
			try {
				in.close();
			} catch (IOException ex) {
			}
			try {
				out.close();
			} catch (IOException ex) {
			}
		}
	}

	public static void init(HttpServletRequest request) {
		if (FileOperateUtil.FILEDIR == null) {
			FileOperateUtil.FILEDIR = request.getSession().getServletContext().getRealPath("/") + "file/";
		}
	}

	public static Map<String, String> getFile(String filePath) {
		Map<String, String> map = new HashMap<String, String>();
		File[] files = new File(FileOperateUtil.FILEDIR).listFiles();
		if (files != null) {
			out: for (File file : files) {
				if (file.isDirectory()) {
					File[] files2 = file.listFiles();
					if (files2 != null) {
						for (File file2 : files2) {
							String name = file2.getName();
							String absPath = file2.getAbsolutePath();
							absPath = absPath.substring(0, absPath.lastIndexOf("\\")) + "/" + absPath.substring(absPath.lastIndexOf("\\") + 1);
							System.out.println("path1:" + absPath );
							System.out.println("path2:" + filePath);
							if (absPath.equals(filePath)) {
								map.put(file2.getParentFile().getName() + "/" + name,
										name.substring(name.lastIndexOf("_") + 1));
								System.out.println("map:" + map.get(file2.getParentFile().getName() + "/" + name));
								break out;
							}
						}
					}
				}
			}
		}
		return map;
	}
}
