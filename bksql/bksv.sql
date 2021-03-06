PGDMP     7                
    x            QuanLySinhVien    12.3    12.3 G    n           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            o           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            p           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            q           1262    16423    QuanLySinhVien    DATABASE     �   CREATE DATABASE "QuanLySinhVien" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
     DROP DATABASE "QuanLySinhVien";
                postgres    false            �            1259    16743 
   qtht_diems    TABLE     �   CREATE TABLE public.qtht_diems (
    id integer NOT NULL,
    diem double precision,
    sinhvienid integer,
    giaovienid integer,
    monhocid integer
);
    DROP TABLE public.qtht_diems;
       public         heap    postgres    false            �            1259    16741    qtht_diems_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_diems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.qtht_diems_id_seq;
       public          postgres    false    212            r           0    0    qtht_diems_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.qtht_diems_id_seq OWNED BY public.qtht_diems.id;
          public          postgres    false    211            �            1259    16542    qtht_giaoviens    TABLE     �   CREATE TABLE public.qtht_giaoviens (
    id integer NOT NULL,
    fullname character varying(50),
    diachi character varying(50),
    phone character varying(10),
    birthday date,
    gioitinh boolean,
    lophocid character varying
);
 "   DROP TABLE public.qtht_giaoviens;
       public         heap    postgres    false            �            1259    16540    qtht_giaoviens_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_giaoviens_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.qtht_giaoviens_group_id_seq;
       public          postgres    false    204            s           0    0    qtht_giaoviens_group_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.qtht_giaoviens_group_id_seq OWNED BY public.qtht_giaoviens.id;
          public          postgres    false    203            �            1259    17436    qtht_khoahocs    TABLE     b   CREATE TABLE public.qtht_khoahocs (
    id integer NOT NULL,
    tenkhoa character varying(50)
);
 !   DROP TABLE public.qtht_khoahocs;
       public         heap    postgres    false            �            1259    17442    qtht_khoahocs_giaoviens_lophocs    TABLE     �   CREATE TABLE public.qtht_khoahocs_giaoviens_lophocs (
    id integer NOT NULL,
    giaovienid integer NOT NULL,
    lophocid integer NOT NULL,
    monhocid integer NOT NULL
);
 3   DROP TABLE public.qtht_khoahocs_giaoviens_lophocs;
       public         heap    postgres    false            �            1259    17434    qtht_khoahocs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_khoahocs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.qtht_khoahocs_id_seq;
       public          postgres    false    219            t           0    0    qtht_khoahocs_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.qtht_khoahocs_id_seq OWNED BY public.qtht_khoahocs.id;
          public          postgres    false    218            �            1259    16570    qtht_lophocs    TABLE     �   CREATE TABLE public.qtht_lophocs (
    id integer NOT NULL,
    tenlop character varying,
    giaovienid integer,
    sinhvienid integer,
    monhocid integer
);
     DROP TABLE public.qtht_lophocs;
       public         heap    postgres    false            �            1259    17421    qtht_lophocs_giaoviens    TABLE     �   CREATE TABLE public.qtht_lophocs_giaoviens (
    lophocid integer NOT NULL,
    giaovienid integer NOT NULL,
    id bigint NOT NULL
);
 *   DROP TABLE public.qtht_lophocs_giaoviens;
       public         heap    postgres    false            �            1259    17426    qtht_lophocs_giaoviens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_lophocs_giaoviens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.qtht_lophocs_giaoviens_id_seq;
       public          postgres    false    216            u           0    0    qtht_lophocs_giaoviens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.qtht_lophocs_giaoviens_id_seq OWNED BY public.qtht_lophocs_giaoviens.id;
          public          postgres    false    217            �            1259    16568    qtht_lophocs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_lophocs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.qtht_lophocs_id_seq;
       public          postgres    false    206            v           0    0    qtht_lophocs_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.qtht_lophocs_id_seq OWNED BY public.qtht_lophocs.id;
          public          postgres    false    205            �            1259    16718    qtht_monhocs    TABLE     h   CREATE TABLE public.qtht_monhocs (
    id integer NOT NULL,
    tenmonhoc character varying NOT NULL
);
     DROP TABLE public.qtht_monhocs;
       public         heap    postgres    false            �            1259    16716    qtht_monhocs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_monhocs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.qtht_monhocs_id_seq;
       public          postgres    false    208            w           0    0    qtht_monhocs_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.qtht_monhocs_id_seq OWNED BY public.qtht_monhocs.id;
          public          postgres    false    207            �            1259    16732    qtht_sinhviens    TABLE     �   CREATE TABLE public.qtht_sinhviens (
    id integer NOT NULL,
    hovaten character varying,
    diachi character varying,
    gioitinh boolean,
    phone character varying,
    birthday date,
    lophocid integer
);
 "   DROP TABLE public.qtht_sinhviens;
       public         heap    postgres    false            �            1259    16730    qtht_sinhviens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_sinhviens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.qtht_sinhviens_id_seq;
       public          postgres    false    210            x           0    0    qtht_sinhviens_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.qtht_sinhviens_id_seq OWNED BY public.qtht_sinhviens.id;
          public          postgres    false    209            �            1259    16844    qtht_thoikhoabieus    TABLE     -  CREATE TABLE public.qtht_thoikhoabieus (
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
       public         heap    postgres    false            �            1259    16842    qtht_thoikhoabieus_id_seq    SEQUENCE     �   CREATE SEQUENCE public.qtht_thoikhoabieus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.qtht_thoikhoabieus_id_seq;
       public          postgres    false    214            y           0    0    qtht_thoikhoabieus_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.qtht_thoikhoabieus_id_seq OWNED BY public.qtht_thoikhoabieus.id;
          public          postgres    false    213            �            1259    16897 
   qtht_users    TABLE     �   CREATE TABLE public.qtht_users (
    username character varying(50) NOT NULL,
    password character varying(50),
    fullname character varying(50)
);
    DROP TABLE public.qtht_users;
       public         heap    postgres    false            �            1259    16522    users    TABLE     �   CREATE TABLE public.users (
    id bigint NOT NULL,
    password character varying(50),
    username character varying(50),
    fulltext_ tsvector,
    hovaten character varying,
    fullname character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �
           2604    16746    qtht_diems id    DEFAULT     n   ALTER TABLE ONLY public.qtht_diems ALTER COLUMN id SET DEFAULT nextval('public.qtht_diems_id_seq'::regclass);
 <   ALTER TABLE public.qtht_diems ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �
           2604    16545    qtht_giaoviens id    DEFAULT     |   ALTER TABLE ONLY public.qtht_giaoviens ALTER COLUMN id SET DEFAULT nextval('public.qtht_giaoviens_group_id_seq'::regclass);
 @   ALTER TABLE public.qtht_giaoviens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    204    204            �
           2604    17439    qtht_khoahocs id    DEFAULT     t   ALTER TABLE ONLY public.qtht_khoahocs ALTER COLUMN id SET DEFAULT nextval('public.qtht_khoahocs_id_seq'::regclass);
 ?   ALTER TABLE public.qtht_khoahocs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �
           2604    16573    qtht_lophocs id    DEFAULT     r   ALTER TABLE ONLY public.qtht_lophocs ALTER COLUMN id SET DEFAULT nextval('public.qtht_lophocs_id_seq'::regclass);
 >   ALTER TABLE public.qtht_lophocs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205    206            �
           2604    17428    qtht_lophocs_giaoviens id    DEFAULT     �   ALTER TABLE ONLY public.qtht_lophocs_giaoviens ALTER COLUMN id SET DEFAULT nextval('public.qtht_lophocs_giaoviens_id_seq'::regclass);
 H   ALTER TABLE public.qtht_lophocs_giaoviens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            �
           2604    16721    qtht_monhocs id    DEFAULT     r   ALTER TABLE ONLY public.qtht_monhocs ALTER COLUMN id SET DEFAULT nextval('public.qtht_monhocs_id_seq'::regclass);
 >   ALTER TABLE public.qtht_monhocs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    208    208            �
           2604    16735    qtht_sinhviens id    DEFAULT     v   ALTER TABLE ONLY public.qtht_sinhviens ALTER COLUMN id SET DEFAULT nextval('public.qtht_sinhviens_id_seq'::regclass);
 @   ALTER TABLE public.qtht_sinhviens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �
           2604    16847    qtht_thoikhoabieus id    DEFAULT     ~   ALTER TABLE ONLY public.qtht_thoikhoabieus ALTER COLUMN id SET DEFAULT nextval('public.qtht_thoikhoabieus_id_seq'::regclass);
 D   ALTER TABLE public.qtht_thoikhoabieus ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            c          0    16743 
   qtht_diems 
   TABLE DATA           P   COPY public.qtht_diems (id, diem, sinhvienid, giaovienid, monhocid) FROM stdin;
    public          postgres    false    212   �P       [          0    16542    qtht_giaoviens 
   TABLE DATA           c   COPY public.qtht_giaoviens (id, fullname, diachi, phone, birthday, gioitinh, lophocid) FROM stdin;
    public          postgres    false    204   Q       j          0    17436    qtht_khoahocs 
   TABLE DATA           4   COPY public.qtht_khoahocs (id, tenkhoa) FROM stdin;
    public          postgres    false    219   R       k          0    17442    qtht_khoahocs_giaoviens_lophocs 
   TABLE DATA           ]   COPY public.qtht_khoahocs_giaoviens_lophocs (id, giaovienid, lophocid, monhocid) FROM stdin;
    public          postgres    false    220   ;R       ]          0    16570    qtht_lophocs 
   TABLE DATA           T   COPY public.qtht_lophocs (id, tenlop, giaovienid, sinhvienid, monhocid) FROM stdin;
    public          postgres    false    206   XR       g          0    17421    qtht_lophocs_giaoviens 
   TABLE DATA           J   COPY public.qtht_lophocs_giaoviens (lophocid, giaovienid, id) FROM stdin;
    public          postgres    false    216   �R       _          0    16718    qtht_monhocs 
   TABLE DATA           5   COPY public.qtht_monhocs (id, tenmonhoc) FROM stdin;
    public          postgres    false    208   -S       a          0    16732    qtht_sinhviens 
   TABLE DATA           b   COPY public.qtht_sinhviens (id, hovaten, diachi, gioitinh, phone, birthday, lophocid) FROM stdin;
    public          postgres    false    210   �S       e          0    16844    qtht_thoikhoabieus 
   TABLE DATA           �   COPY public.qtht_thoikhoabieus (id, lophocid, monhocid, giaovienid, phonghoc, thu, thoiluong, thoigian, ngaybatdau, ngayketthuc) FROM stdin;
    public          postgres    false    214   T       f          0    16897 
   qtht_users 
   TABLE DATA           B   COPY public.qtht_users (username, password, fullname) FROM stdin;
    public          postgres    false    215   jT       Y          0    16522    users 
   TABLE DATA           U   COPY public.users (id, password, username, fulltext_, hovaten, fullname) FROM stdin;
    public          postgres    false    202   �T       z           0    0    qtht_diems_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.qtht_diems_id_seq', 4, true);
          public          postgres    false    211            {           0    0    qtht_giaoviens_group_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.qtht_giaoviens_group_id_seq', 43, true);
          public          postgres    false    203            |           0    0    qtht_khoahocs_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.qtht_khoahocs_id_seq', 1, true);
          public          postgres    false    218            }           0    0    qtht_lophocs_giaoviens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.qtht_lophocs_giaoviens_id_seq', 30, true);
          public          postgres    false    217            ~           0    0    qtht_lophocs_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.qtht_lophocs_id_seq', 10, true);
          public          postgres    false    205                       0    0    qtht_monhocs_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.qtht_monhocs_id_seq', 12, true);
          public          postgres    false    207            �           0    0    qtht_sinhviens_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.qtht_sinhviens_id_seq', 6, true);
          public          postgres    false    209            �           0    0    qtht_thoikhoabieus_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.qtht_thoikhoabieus_id_seq', 3, true);
          public          postgres    false    213            �
           2606    16748    qtht_diems diem 
   CONSTRAINT     M   ALTER TABLE ONLY public.qtht_diems
    ADD CONSTRAINT diem PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.qtht_diems DROP CONSTRAINT diem;
       public            postgres    false    212            �
           2606    16547    qtht_giaoviens groups_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.qtht_giaoviens
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.qtht_giaoviens DROP CONSTRAINT groups_pkey;
       public            postgres    false    204            �
           2606    17441    qtht_khoahocs khoahoc 
   CONSTRAINT     S   ALTER TABLE ONLY public.qtht_khoahocs
    ADD CONSTRAINT khoahoc PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.qtht_khoahocs DROP CONSTRAINT khoahoc;
       public            postgres    false    219            �
           2606    16575    qtht_lophocs lophoc 
   CONSTRAINT     Q   ALTER TABLE ONLY public.qtht_lophocs
    ADD CONSTRAINT lophoc PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.qtht_lophocs DROP CONSTRAINT lophoc;
       public            postgres    false    206            �
           2606    16723    qtht_monhocs monhoc 
   CONSTRAINT     Q   ALTER TABLE ONLY public.qtht_monhocs
    ADD CONSTRAINT monhoc PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.qtht_monhocs DROP CONSTRAINT monhoc;
       public            postgres    false    208            �
           2606    17446 D   qtht_khoahocs_giaoviens_lophocs qtht_khoahocs_giaoviens_lophocs_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qtht_khoahocs_giaoviens_lophocs
    ADD CONSTRAINT qtht_khoahocs_giaoviens_lophocs_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.qtht_khoahocs_giaoviens_lophocs DROP CONSTRAINT qtht_khoahocs_giaoviens_lophocs_pkey;
       public            postgres    false    220            �
           2606    17433 2   qtht_lophocs_giaoviens qtht_lophocs_giaoviens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.qtht_lophocs_giaoviens
    ADD CONSTRAINT qtht_lophocs_giaoviens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.qtht_lophocs_giaoviens DROP CONSTRAINT qtht_lophocs_giaoviens_pkey;
       public            postgres    false    216            �
           2606    16901    qtht_users qtht_users_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.qtht_users
    ADD CONSTRAINT qtht_users_pkey PRIMARY KEY (username);
 D   ALTER TABLE ONLY public.qtht_users DROP CONSTRAINT qtht_users_pkey;
       public            postgres    false    215            �
           2606    16737    qtht_sinhviens sinhvien 
   CONSTRAINT     U   ALTER TABLE ONLY public.qtht_sinhviens
    ADD CONSTRAINT sinhvien PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.qtht_sinhviens DROP CONSTRAINT sinhvien;
       public            postgres    false    210            �
           2606    16849    qtht_thoikhoabieus thoikhoabieu 
   CONSTRAINT     ]   ALTER TABLE ONLY public.qtht_thoikhoabieus
    ADD CONSTRAINT thoikhoabieu PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.qtht_thoikhoabieus DROP CONSTRAINT thoikhoabieu;
       public            postgres    false    214            �
           2606    16529    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    202            �
           1259    16553    fulltext_index    INDEX     C   CREATE INDEX fulltext_index ON public.users USING gin (fulltext_);
 "   DROP INDEX public.fulltext_index;
       public            postgres    false    202            �
           2620    16551    users fulltext_update    TRIGGER     �   CREATE TRIGGER fulltext_update BEFORE INSERT OR UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION tsvector_update_trigger('fulltext_', 'pg_catalog.english', 'hovaten');
 .   DROP TRIGGER fulltext_update ON public.users;
       public          postgres    false    202            c   ,   x�3��3�4�42�44� �	��	�m�id�i����� ���      [      x���?n�0���S�A�����S�)�4�<T�0!$��%X��^$7��Ѧi1�%K���~z?��.����c��T�����Lus��p*ۊc��1b!�$D�C�@�����㶜�2����H7K�����,W��p�ݾ�p�h꽥�h���l�gK�"q��Mmal�"Q��?p2����NfeSh�f��sC��]�D������sfϥЫd�r�2�ߟT�=�Ȏd�=�s��>����	�.��      j      x�3�4��4����� 8�      k      x������ � �      ]   A   x�-ɱ� ����q�N��(��1��tic�(�ҷjx�
U�P�rxH�杅_"��o�      g   t   x��� ���b2؀�^�Y�Y´V)《֚����x�#<��O�3Fwk*�e���DR[��f�[�^�u��4<�I�/���pz!l�^�n^��W�<�OD� r�       _   P   x�3�L�+)�2�t>�P�����
)w�W��|�������vas��؅-�`7�*�`�e�C��S�=... �sy      a   n   x�3�LL�tIT�K�K�L㴀 N##]s]CNs.μ����<���L���\�#/P�{�k+v=�@=�hz�Pt�pX����)D�!P/H��F��1~�f\1z\\\ ��1
      e   O   x�3�4�4�42�42 Q&���
I�wO��71��>�0/]�"��@��Hj����Z��Ɔ\F@c�(7&F��� !�      f   )   x�KL����442615��K/�|��5O��(1/�+F��� �J
�      Y   l   x�3�442615�LL����T�9�(W��XA=/������<u+C��#�@��TP!(��T����e�b�!И#�@cL�s�mx�{n&�F�B�+� ������� z�;w     