package net.sppan.blog.utils;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.storage.persistent.FileRecorder;
import com.qiniu.util.Auth;
import java.io.IOException;
import java.nio.file.Paths;

/**
 * 上传工具
 */
public class QiniuUtils {

    private static  String ACCESSKEY = "k8yB3tREZY-eMJ_xnW2d37ucljtcVX8PCcK4bGf0";
    private static  String SECRETKEY = "_CCNMugIoRUVeSU9SnFRk9k_t42u95Em9H19wfTb";
    public static   String UPLODURL = "http://p5yybw1lm.bkt.clouddn.com/";
    public static   String ALBUMURL = "http://p68n9hcto.bkt.clouddn.com/";

    public static Auth getAuth() {
        return Auth.create(ACCESSKEY, SECRETKEY);
    }

    /**
     *  文件上传
     * @param localFilePath 文件上传的绝对路径
     * @param bucket bucket 名称
     * @return 状态
     */
    public static String upload2qiniu(String localFilePath,String bucket) {
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone1());
        //...其他参数参考类注释
        //...生成上传凭证，然后准备上传
        //如果是Windows情况下，格式是 D:\\qiniu\\test.png
        String upToken = getAuth().uploadToken(bucket);
        String localTempDir = Paths.get(System.getenv("java.io.tmpdir"), bucket).toString();
        try {
            //设置断点续传文件进度保存目录
            FileRecorder fileRecorder = new FileRecorder(localTempDir);
            UploadManager uploadManager = new UploadManager(cfg, fileRecorder);
            try {
                Response response = uploadManager.put(localFilePath, null, upToken);
                //解析上传成功的结果
                DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
                System.out.println(putRet.key);
                System.out.println(putRet.hash);
                return putRet.key;
            } catch (QiniuException ex) {
                Response r = ex.response;
                System.err.println(r.toString());
                try {
                    System.err.println(r.bodyString());
                } catch (QiniuException ex2) {
                    //ignore
                }
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /**
     * 删除文件
     * @param key 文件名称
     */
    public static void deleteFile(String key,String bucket) {
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone1());
        //...其他参数参考类注释
        BucketManager bucketManager = new BucketManager(getAuth(), cfg);
        try {
            bucketManager.delete(bucket, key);
        } catch (QiniuException ex) {
            //如果遇到异常，说明删除失败
            System.err.println(ex.code());
            System.err.println(ex.response.toString());
        }
    }

    /**
     * 获取文件信息
     * @param key 文件名称
     */
    public static void info(String key,String bucket) {
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone1());
        //...其他参数参考类注释
        BucketManager bucketManager = new BucketManager(getAuth(), cfg);
        try {
            FileInfo fileInfo = bucketManager.stat(bucket, key);
            System.out.println(fileInfo.hash);
            System.out.println(fileInfo.fsize);
            System.out.println(fileInfo.mimeType);
            System.out.println(fileInfo.putTime);
        } catch (QiniuException ex) {
            System.err.println(ex.response.toString());
        }
    }

    /**
     * 获取空间文件列表
     */
    public static void list(String bucket) {
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone1());
        BucketManager bucketManager = new BucketManager(getAuth(), cfg);
        //文件名前缀
        String prefix = "";
        //每次迭代的长度限制，最大1000，推荐值 1000
        int limit = 1000;
        //指定目录分隔符，列出所有公共前缀（模拟列出目录效果）。缺省值为空字符串
        String delimiter = "";
        //列举空间文件列表
        BucketManager.FileListIterator fileListIterator = bucketManager.createFileListIterator(bucket, prefix, limit, delimiter);
        while (fileListIterator.hasNext()) {
            //处理获取的file list结果
            FileInfo[] items = fileListIterator.next();
            for (FileInfo item : items) {
                System.out.println(item.key);
                System.out.println(item.hash);
                System.out.println(item.fsize);
                System.out.println(item.mimeType);
                System.out.println(item.putTime);
                System.out.println(item.endUser);
            }
        }
    }

    public static void main(String[] args) {
        upload2qiniu("C:\\Users\\Administrator\\Desktop/girl.jpg","luoyuanxiang");
    }
}
