PGDMP     )                
    x            QuanLySinhVien    13beta3    13beta3 Q    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    38930    QuanLySinhVien    DATABASE     t   CREATE DATABASE "QuanLySinhVien" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
     DROP DATABASE "QuanLySinhVien";
                postgres    false            �            1259    39041    qtht_chucnang_user    TABLE     �   CREATE TABLE public.qtht_chucnang_user (
    id bigint NOT NULL,
    user_id character varying NOT NULL,
    chucnang_id character varying NOT NULL
);
 &   DROP TABLE public.qtht_chucnang_user;
       public         heap    postgres    false            �            1259    39045    qtht_chucnang_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_chucnang_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.qtht_chucnang_user_id_seq;
       public          postgres    false    220            �           0    0    qtht_chucnang_user_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.qtht_chucnang_user_id_seq OWNED BY public.qtht_chucnang_user.id;
          public          postgres    false    221            �            1259    39038    qtht_chucnangs    TABLE     v   CREATE TABLE public.qtht_chucnangs (
    tenchucnang character varying NOT NULL,
    id character varying NOT NULL
);
 "   DROP TABLE public.qtht_chucnangs;
       public         heap    postgres    false            �            1259    38931 
   qtht_diems    TABLE     �   CREATE TABLE public.qtht_diems (
    id integer NOT NULL,
    diem double precision,
    sinhvienid integer,
    giaovienid integer,
    monhocid integer
);
    DROP TABLE public.qtht_diems;
       public         heap    postgres    false            �            1259    38934    qtht_diems_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_diems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.qtht_diems_id_seq;
       public          postgres    false    200            �           0    0    qtht_diems_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.qtht_diems_id_seq OWNED BY public.qtht_diems.id;
          public          postgres    false    201            �            1259    38936    qtht_giaoviens    TABLE     �   CREATE TABLE public.qtht_giaoviens (
    id integer NOT NULL,
    fullname character varying(50),
    diachi character varying(50),
    phone character varying(10),
    birthday date,
    gioitinh boolean,
    lophocid character varying
);
 "   DROP TABLE public.qtht_giaoviens;
       public         heap    postgres    false            �            1259    38942    qtht_giaoviens_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_giaoviens_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.qtht_giaoviens_group_id_seq;
       public          postgres    false    202            �           0    0    qtht_giaoviens_group_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.qtht_giaoviens_group_id_seq OWNED BY public.qtht_giaoviens.id;
          public          postgres    false    203            �            1259    38944    qtht_khoahocs    TABLE     b   CREATE TABLE public.qtht_khoahocs (
    id integer NOT NULL,
    tenkhoa character varying(50)
);
 !   DROP TABLE public.qtht_khoahocs;
       public         heap    postgres    false            �            1259    38947    qtht_khoahocs_giaoviens_lophocs    TABLE     �   CREATE TABLE public.qtht_khoahocs_giaoviens_lophocs (
    id integer NOT NULL,
    giaovienid integer NOT NULL,
    lophocid integer NOT NULL,
    monhocid integer NOT NULL
);
 3   DROP TABLE public.qtht_khoahocs_giaoviens_lophocs;
       public         heap    postgres    false            �            1259    38950    qtht_khoahocs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_khoahocs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.qtht_khoahocs_id_seq;
       public          postgres    false    204            �           0    0    qtht_khoahocs_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.qtht_khoahocs_id_seq OWNED BY public.qtht_khoahocs.id;
          public          postgres    false    206            �            1259    38952    qtht_lophocs    TABLE     �   CREATE TABLE public.qtht_lophocs (
    id integer NOT NULL,
    tenlop character varying,
    giaovienid integer,
    sinhvienid integer,
    monhocid integer
);
     DROP TABLE public.qtht_lophocs;
       public         heap    postgres    false            �            1259    38958    qtht_lophocs_giaoviens    TABLE     �   CREATE TABLE public.qtht_lophocs_giaoviens (
    lophocid integer NOT NULL,
    giaovienid integer NOT NULL,
    monhocid integer NOT NULL,
    id integer NOT NULL
);
 *   DROP TABLE public.qtht_lophocs_giaoviens;
       public         heap    postgres    false            �            1259    39030    qtht_lophocs_giaoviens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_lophocs_giaoviens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.qtht_lophocs_giaoviens_id_seq;
       public          postgres    false    208            �           0    0    qtht_lophocs_giaoviens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.qtht_lophocs_giaoviens_id_seq OWNED BY public.qtht_lophocs_giaoviens.id;
          public          postgres    false    218            �            1259    38963    qtht_lophocs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_lophocs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.qtht_lophocs_id_seq;
       public          postgres    false    207            �           0    0    qtht_lophocs_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.qtht_lophocs_id_seq OWNED BY public.qtht_lophocs.id;
          public          postgres    false    209            �            1259    38965    qtht_monhocs    TABLE     h   CREATE TABLE public.qtht_monhocs (
    id integer NOT NULL,
    tenmonhoc character varying NOT NULL
);
     DROP TABLE public.qtht_monhocs;
       public         heap    postgres    false            �            1259    38971    qtht_monhocs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_monhocs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.qtht_monhocs_id_seq;
       public          postgres    false    210            �           0    0    qtht_monhocs_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.qtht_monhocs_id_seq OWNED BY public.qtht_monhocs.id;
          public          postgres    false    211            �            1259    38973    qtht_sinhviens    TABLE     �   CREATE TABLE public.qtht_sinhviens (
    id integer NOT NULL,
    hovaten character varying,
    diachi character varying,
    gioitinh boolean,
    phone character varying,
    birthday date,
    lophocid integer
);
 "   DROP TABLE public.qtht_sinhviens;
       public         heap    postgres    false            �            1259    38979    qtht_sinhviens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_sinhviens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.qtht_sinhviens_id_seq;
       public          postgres    false    212            �           0    0    qtht_sinhviens_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.qtht_sinhviens_id_seq OWNED BY public.qtht_sinhviens.id;
          public          postgres    false    213            �            1259    38981    qtht_thoikhoabieus    TABLE     -  CREATE TABLE public.qtht_thoikhoabieus (
    id integer NOT NULL,
    lophocid integer,
    monhocid integer,
    giaovienid integer,
    phonghoc character varying(50),
    thu integer,
    thoiluong character varying(50),
    thoigian character varying,
    ngaybatdau date,
    ngayketthuc date
);
 &   DROP TABLE public.qtht_thoikhoabieus;
       public         heap    postgres    false            �            1259    38987    qtht_thoikhoabieus_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_thoikhoabieus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.qtht_thoikhoabieus_id_seq;
       public          postgres    false    214            �           0    0    qtht_thoikhoabieus_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.qtht_thoikhoabieus_id_seq OWNED BY public.qtht_thoikhoabieus.id;
          public          postgres    false    215            �            1259    38989 
   qtht_users    TABLE     �   CREATE TABLE public.qtht_users (
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    fullname character varying(50)
);
    DROP TABLE public.qtht_users;
       public         heap    postgres    false            �            1259    38992    users    TABLE     �   CREATE TABLE public.users (
    id bigint NOT NULL,
    password character varying(50),
    username character varying(50),
    fulltext_ tsvector,
    hovaten character varying,
    fullname character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �
           2604    39047    qtht_chucnang_user id    DEFAULT     ~   ALTER TABLE ONLY public.qtht_chucnang_user ALTER COLUMN id SET DEFAULT nextval('public.qtht_chucnang_user_id_seq'::regclass);
 D   ALTER TABLE public.qtht_chucnang_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            �
           2604    38998    qtht_diems id    DEFAULT     n   ALTER TABLE ONLY public.qtht_diems ALTER COLUMN id SET DEFAULT nextval('public.qtht_diems_id_seq'::regclass);
 <   ALTER TABLE public.qtht_diems ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200            �
           2604    38999    qtht_giaoviens id    DEFAULT     |   ALTER TABLE ONLY public.qtht_giaoviens ALTER COLUMN id SET DEFAULT nextval('public.qtht_giaoviens_group_id_seq'::regclass);
 @   ALTER TABLE public.qtht_giaoviens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    39000    qtht_khoahocs id    DEFAULT     t   ALTER TABLE ONLY public.qtht_khoahocs ALTER COLUMN id SET DEFAULT nextval('public.qtht_khoahocs_id_seq'::regclass);
 ?   ALTER TABLE public.qtht_khoahocs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    204            �
           2604    39001    qtht_lophocs id    DEFAULT     r   ALTER TABLE ONLY public.qtht_lophocs ALTER COLUMN id SET DEFAULT nextval('public.qtht_lophocs_id_seq'::regclass);
 >   ALTER TABLE public.qtht_lophocs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    207            �
           2604    39032    qtht_lophocs_giaoviens id    DEFAULT     �   ALTER TABLE ONLY public.qtht_lophocs_giaoviens ALTER COLUMN id SET DEFAULT nextval('public.qtht_lophocs_giaoviens_id_seq'::regclass);
 H   ALTER TABLE public.qtht_lophocs_giaoviens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    208            �
           2604    39003    qtht_monhocs id    DEFAULT     r   ALTER TABLE ONLY public.qtht_monhocs ALTER COLUMN id SET DEFAULT nextval('public.qtht_monhocs_id_seq'::regclass);
 >   ALTER TABLE public.qtht_monhocs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210            �
           2604    39004    qtht_sinhviens id    DEFAULT     v   ALTER TABLE ONLY public.qtht_sinhviens ALTER COLUMN id SET DEFAULT nextval('public.qtht_sinhviens_id_seq'::regclass);
 @   ALTER TABLE public.qtht_sinhviens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212            �
           2604    39005    qtht_thoikhoabieus id    DEFAULT     ~   ALTER TABLE ONLY public.qtht_thoikhoabieus ALTER COLUMN id SET DEFAULT nextval('public.qtht_thoikhoabieus_id_seq'::regclass);
 D   ALTER TABLE public.qtht_thoikhoabieus ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            �          0    39041    qtht_chucnang_user 
   TABLE DATA           F   COPY public.qtht_chucnang_user (id, user_id, chucnang_id) FROM stdin;
    public          postgres    false    220   \       �          0    39038    qtht_chucnangs 
   TABLE DATA           9   COPY public.qtht_chucnangs (tenchucnang, id) FROM stdin;
    public          postgres    false    219   4\       �          0    38931 
   qtht_diems 
   TABLE DATA           P   COPY public.qtht_diems (id, diem, sinhvienid, giaovienid, monhocid) FROM stdin;
    public          postgres    false    200   �\       �          0    38936    qtht_giaoviens 
   TABLE DATA           c   COPY public.qtht_giaoviens (id, fullname, diachi, phone, birthday, gioitinh, lophocid) FROM stdin;
    public          postgres    false    202   �\       �          0    38944    qtht_khoahocs 
   TABLE DATA           4   COPY public.qtht_khoahocs (id, tenkhoa) FROM stdin;
    public          postgres    false    204   �]       �          0    38947    qtht_khoahocs_giaoviens_lophocs 
   TABLE DATA           ]   COPY public.qtht_khoahocs_giaoviens_lophocs (id, giaovienid, lophocid, monhocid) FROM stdin;
    public          postgres    false    205   ^       �          0    38952    qtht_lophocs 
   TABLE DATA           T   COPY public.qtht_lophocs (id, tenlop, giaovienid, sinhvienid, monhocid) FROM stdin;
    public          postgres    false    207   *^       �          0    38958    qtht_lophocs_giaoviens 
   TABLE DATA           T   COPY public.qtht_lophocs_giaoviens (lophocid, giaovienid, monhocid, id) FROM stdin;
    public          postgres    false    208   {^       �          0    38965    qtht_monhocs 
   TABLE DATA           5   COPY public.qtht_monhocs (id, tenmonhoc) FROM stdin;
    public          postgres    false    210   �^       �          0    38973    qtht_sinhviens 
   TABLE DATA           b   COPY public.qtht_sinhviens (id, hovaten, diachi, gioitinh, phone, birthday, lophocid) FROM stdin;
    public          postgres    false    212   5_       �          0    38981    qtht_thoikhoabieus 
   TABLE DATA           �   COPY public.qtht_thoikhoabieus (id, lophocid, monhocid, giaovienid, phonghoc, thu, thoiluong, thoigian, ngaybatdau, ngayketthuc) FROM stdin;
    public          postgres    false    214   �_       �          0    38989 
   qtht_users 
   TABLE DATA           B   COPY public.qtht_users (username, password, fullname) FROM stdin;
    public          postgres    false    216   `       �          0    38992    users 
   TABLE DATA           U   COPY public.users (id, password, username, fulltext_, hovaten, fullname) FROM stdin;
    public          postgres    false    217   U`       �           0    0    qtht_chucnang_user_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.qtht_chucnang_user_id_seq', 12, true);
          public          postgres    false    221            �           0    0    qtht_diems_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.qtht_diems_id_seq', 4, true);
          public          postgres    false    201            �           0    0    qtht_giaoviens_group_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.qtht_giaoviens_group_id_seq', 43, true);
          public          postgres    false    203            �           0    0    qtht_khoahocs_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.qtht_khoahocs_id_seq', 1, true);
          public          postgres    false    206            �           0    0    qtht_lophocs_giaoviens_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.qtht_lophocs_giaoviens_id_seq', 361, true);
          public          postgres    false    218            �           0    0    qtht_lophocs_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.qtht_lophocs_id_seq', 10, true);
          public          postgres    false    209            �           0    0    qtht_monhocs_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.qtht_monhocs_id_seq', 12, true);
          public          postgres    false    211            �           0    0    qtht_sinhviens_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.qtht_sinhviens_id_seq', 6, true);
          public          postgres    false    213            �           0    0    qtht_thoikhoabieus_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.qtht_thoikhoabieus_id_seq', 3, true);
          public          postgres    false    215            �
           2606    39007    qtht_diems diem 
   CONSTRAINT     M   ALTER TABLE ONLY public.qtht_diems
    ADD CONSTRAINT diem PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.qtht_diems DROP CONSTRAINT diem;
       public            postgres    false    200            �
           2606    39009    qtht_giaoviens groups_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.qtht_giaoviens
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.qtht_giaoviens DROP CONSTRAINT groups_pkey;
       public            postgres    false    202            �
           2606    39011    qtht_khoahocs khoahoc 
   CONSTRAINT     S   ALTER TABLE ONLY public.qtht_khoahocs
    ADD CONSTRAINT khoahoc PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.qtht_khoahocs DROP CONSTRAINT khoahoc;
       public            postgres    false    204            �
           2606    39013    qtht_lophocs lophoc 
   CONSTRAINT     Q   ALTER TABLE ONLY public.qtht_lophocs
    ADD CONSTRAINT lophoc PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.qtht_lophocs DROP CONSTRAINT lophoc;
       public            postgres    false    207            �
           2606    39015    qtht_monhocs monhoc 
   CONSTRAINT     Q   ALTER TABLE ONLY public.qtht_monhocs
    ADD CONSTRAINT monhoc PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.qtht_monhocs DROP CONSTRAINT monhoc;
       public            postgres    false    210                       2606    39052 *   qtht_chucnang_user qtht_chucnang_user_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.qtht_chucnang_user
    ADD CONSTRAINT qtht_chucnang_user_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.qtht_chucnang_user DROP CONSTRAINT qtht_chucnang_user_pkey;
       public            postgres    false    220                       2606    39057 "   qtht_chucnangs qtht_chucnangs_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.qtht_chucnangs
    ADD CONSTRAINT qtht_chucnangs_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.qtht_chucnangs DROP CONSTRAINT qtht_chucnangs_pkey;
       public            postgres    false    219            �
           2606    39017 D   qtht_khoahocs_giaoviens_lophocs qtht_khoahocs_giaoviens_lophocs_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qtht_khoahocs_giaoviens_lophocs
    ADD CONSTRAINT qtht_khoahocs_giaoviens_lophocs_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.qtht_khoahocs_giaoviens_lophocs DROP CONSTRAINT qtht_khoahocs_giaoviens_lophocs_pkey;
       public            postgres    false    205            �
           2606    39037 2   qtht_lophocs_giaoviens qtht_lophocs_giaoviens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.qtht_lophocs_giaoviens
    ADD CONSTRAINT qtht_lophocs_giaoviens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.qtht_lophocs_giaoviens DROP CONSTRAINT qtht_lophocs_giaoviens_pkey;
       public            postgres    false    208            �
           2606    39021    qtht_users qtht_users_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.qtht_users
    ADD CONSTRAINT qtht_users_pkey PRIMARY KEY (username);
 D   ALTER TABLE ONLY public.qtht_users DROP CONSTRAINT qtht_users_pkey;
       public            postgres    false    216            �
           2606    39023    qtht_sinhviens sinhvien 
   CONSTRAINT     U   ALTER TABLE ONLY public.qtht_sinhviens
    ADD CONSTRAINT sinhvien PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.qtht_sinhviens DROP CONSTRAINT sinhvien;
       public            postgres    false    212            �
           2606    39025    qtht_thoikhoabieus thoikhoabieu 
   CONSTRAINT     ]   ALTER TABLE ONLY public.qtht_thoikhoabieus
    ADD CONSTRAINT thoikhoabieu PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.qtht_thoikhoabieus DROP CONSTRAINT thoikhoabieu;
       public            postgres    false    214                        2606    39027    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            �
           1259    39028    fulltext_index    INDEX     C   CREATE INDEX fulltext_index ON public.users USING gin (fulltext_);
 "   DROP INDEX public.fulltext_index;
       public            postgres    false    217                       2620    39029    users fulltext_update    TRIGGER     �   CREATE TRIGGER fulltext_update BEFORE INSERT OR UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION tsvector_update_trigger('fulltext_', 'pg_catalog.english', 'hovaten');
 .   DROP TRIGGER fulltext_update ON public.users;
       public          postgres    false    217            �      x������ � �      �   n   x�K~�km�B^�*QH�<�0_�,��<�`�0�x���� ���xwOG��0OW?���\��ļ����3�uq�x��V��~l���s3R��K�(v����� E�5_      �   ,   x�3��3�4�42�44� �	��	�m�id�i����� ���      �   �   x���=�0Fg��@��i��2!�.Q�2e@���G�,t���&���_�)K޳�92�͗#��������8�]�VU�!$�A�d�H
 H�A3EߴV�X*B�LI�Z�d�I�A�����qO���"_9n�"ߤ��&�e�}�u �����1����ܟ�����#M�Ǵ�k�+�j"*Wx�W���U5J`�]�o��w�q�����>G�6!i1��n��\      �      x�3�4��4����� 8�      �      x������ � �      �   A   x�-ɱ� ����q�N��(��1��tic�(�ҷjx�
U�P�rxH�杅_"��o�      �   J   x�5��� C��x�*`��?G�P���+�x�I�ļ\X��g)L��q��E�%^�`p8�v������> >T�~      �   P   x�3�L�+)�2�t>�P�����
)w�W��|�������vas��؅-�`7�*�`�e�C��S�=... �sy      �   n   x�3�LL�tIT�K�K�L㴀 N##]s]CNs.μ����<���L���\�#/P�{�k+v=�@=�hz�Pt�pX����)D�!P/H��F��1~�f\1z\\\ ��1
      �   O   x�3�4�4�42�42 Q&���
I�wO��71��>�0/]�"��@��Hj����Z��Ɔ\F@c�(7&F��� !�      �   3   x�KL����442615��K/�|��5O��(1/�Lrr��h?�=... �d      �   l   x�3�442615�LL����T�9�(W��XA=/������<u+C��#�@��TP!(��T����e�b�!И#�@cL�s�mx�{n&�F�B�+� ������� z�;w     